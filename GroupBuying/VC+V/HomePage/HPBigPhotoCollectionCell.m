//
//  HPBigPhotoCollectionCell.m
//  GroupBuying
//
//  Created by teason on 16/8/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HPBigPhotoCollectionCell.h"
#import "TestUser.h"
#import "NoteListViewItem.h"
#import "UIImageView+SDQN.h"
#import "Pic.h"


@interface HPBigPhotoCollectionCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIView *sepline;
@property (weak, nonatomic) IBOutlet UIButton *btCollection;
@property (weak, nonatomic) IBOutlet UIButton *btComment;
@property (weak, nonatomic) IBOutlet UIButton *btLike;
@property (weak, nonatomic) IBOutlet UILabel *labelCommentNum;

@end

@implementation HPBigPhotoCollectionCell

#pragma mark -
- (void)setNoteItem:(NoteListViewItem *)noteItem
{
    _noteItem = noteItem ;
    

    [_imgView xt_setOriginalImageWithPic:noteItem.img] ;
    
    _labelTitle.text = noteItem.articleTitle ;
    _btCollection.selected = noteItem.isFavorite ;
    _btLike.selected = noteItem.isUpvote ;
    [_btLike setTitle:[NSString stringWithFormat:@"%ld",noteItem.upvoteCnt] forState:0] ;
    _labelCommentNum.text = [NSString stringWithFormat:@"%ld",noteItem.commentCnt] ;
}




#pragma mark -
- (void)awakeFromNib
{
    self.backgroundColor = [UIColor whiteColor] ;
    _labelTitle.textColor = [UIColor xt_w_dark] ;
    _sepline.backgroundColor = [UIColor xt_seperate] ;
    [_btLike setTitleColor:[UIColor xt_w_light] forState:0] ;
    _labelCommentNum.textColor = [UIColor xt_w_light] ;
}

+ (CGSize)getSizeWithTitleStr:(NSString *)titleStr
{
    UIFont *font = [UIFont systemFontOfSize:13] ;
    CGSize size = CGSizeMake(APP_WIDTH - 2 * 12., 100.) ;
    CGSize labelSize = [titleStr boundingRectWithSize:size
                                              options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                           attributes:@{NSFontAttributeName:font}
                                              context:nil].size ;
    CGFloat titleHeight = labelSize.height ;
    float height = APP_WIDTH * 1000 / 750 + 75. - 16 + titleHeight ;
    return CGSizeMake(APP_WIDTH, height) ;
}

- (IBAction)btCollectionOnClick:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectNoteID:addOrRemove:)]) {
        BOOL haslogin = [self.delegate collectNoteID:_noteItem.articleId addOrRemove:!sender.selected] ;
        if (!haslogin) return ;
        sender.selected = !sender.selected ;
    }
}

- (IBAction)btLikeOnClick:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(likeNoteID:addOrRemove:)]) {
        BOOL haslogin = [self.delegate likeNoteID:_noteItem.articleId addOrRemove:!sender.selected] ;
        if (!haslogin) return ;
        sender.selected = !sender.selected ;
        sender.selected ? ++_noteItem.upvoteCnt : --_noteItem.upvoteCnt ;
        [_btLike setTitle:[NSString stringWithFormat:@"%ld",_noteItem.upvoteCnt] forState:0] ;
    }
}

@end


