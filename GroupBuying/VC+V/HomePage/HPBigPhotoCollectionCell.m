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
#import "UIImageView+WebCache.h"
#import "Pic.h"
#import "YXLTagEditorImageView.h"
#import "ArticlePicItem.h"
#import "ArticlePicItemInfo.h"
#import "Article.h"

@interface HPBigPhotoCollectionCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIView *imgContainer;
@property (weak, nonatomic) IBOutlet UIView *sepline;
@property (weak, nonatomic) IBOutlet UIButton *btCollection;
@property (weak, nonatomic) IBOutlet UIButton *btComment;
@property (weak, nonatomic) IBOutlet UIButton *btLike;
@property (weak, nonatomic) IBOutlet UILabel *labelLikeNum;
@property (weak, nonatomic) IBOutlet UILabel *labelCommentNum;

@property (nonatomic,strong)YXLTagEditorImageView *tagEditorImageView;


@end

@implementation HPBigPhotoCollectionCell

#pragma mark -
- (void)setNoteItem:(NoteListViewItem *)noteItem
{
    _noteItem = noteItem ;
    
//    
//    [_imgProductView sd_setImageWithURL:[NSURL URLWithString:noteItem.img.qiniuUrl]] ;
    _labelTitle.text = noteItem.articleTitle ;
    _btCollection.selected = noteItem.isFavorite ;
    _btLike.selected = noteItem.isUpvote ;
    _labelLikeNum.text = [NSString stringWithFormat:@"%ld",noteItem.upvoteCnt] ;
    _labelCommentNum.text = [NSString stringWithFormat:@"%ld",noteItem.commentCnt] ;
    
    
    [self.tagEditorImageView.imagePreviews sd_setImageWithURL:[NSURL URLWithString:noteItem.img.qiniuUrl]
                                                    completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                                        
//                                                        for (int i = 0; i < itemWillDisplay.items.count; i++)
//                                                        {
//                                                            ArticlePicItemInfo *itemInfo = itemWillDisplay.items[i] ;
//                                                            [self.tagEditorImageView addTagViewText:itemInfo.text
//                                                                                           Location:CGPointMake(itemInfo.posX, itemInfo.posY)
//                                                                              isPositiveAndNegative:[itemInfo positiveOrNagitive]
//                                                                                               type:itemInfo.type] ;
//                                                        }
                                                        
                                                    }] ;

}

- (YXLTagEditorImageView *)tagEditorImageView
{
    if (!_tagEditorImageView)
    {
        CGRect rect = CGRectZero ;
        rect.size = CGSizeMake(APP_WIDTH, APP_WIDTH * 1000 / 750) ;
        _tagEditorImageView = [[YXLTagEditorImageView alloc] initWithImage:nil frame:rect] ;
        _tagEditorImageView.userInteractionEnabled = NO ;
    }
    return _tagEditorImageView ;
}


#pragma mark -
- (void)awakeFromNib
{
    self.backgroundColor = [UIColor whiteColor] ;
    _labelTitle.textColor = [UIColor xt_w_dark] ;
    _sepline.backgroundColor = [UIColor xt_seperate] ;
    _labelLikeNum.textColor = [UIColor xt_w_light] ;
    _labelCommentNum.textColor = [UIColor xt_w_light] ;
    
    [_imgContainer addSubview:self.tagEditorImageView] ;
    [self.tagEditorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_imgContainer) ;
    }];

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
    sender.selected = !sender.selected ;
}

- (IBAction)btCommentOnClick:(id)sender
{
    NSLog(@"评论 ") ;
}

- (IBAction)btLikeOnClick:(UIButton *)sender
{
    sender.selected = !sender.selected ;
}

@end


