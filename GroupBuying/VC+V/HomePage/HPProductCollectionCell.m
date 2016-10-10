//
//  HPProductCollectionCell.m
//  GroupBuying
//
//  Created by teason on 16/8/18.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HPProductCollectionCell.h"
#import "TestUser.h"
#import "NoteListViewItem.h"
#import "Pic.h"
#import "UIImageView+WebCache.h"

@interface HPProductCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *btCollect;
@property (weak, nonatomic) IBOutlet UIButton *btLike;

@end

@implementation HPProductCollectionCell

- (void)setIndex:(int)index
{
    _index = index ;
    
    _imgView.image = [UIImage imageNamed:[TestUser bigImage:index]] ;
}

- (void)setNoteItem:(NoteListViewItem *)noteItem
{
    _noteItem = noteItem ;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:noteItem.img.qiniuUrl]] ;
    _btCollect.selected = noteItem.isFavorite ;
    _btLike.selected = noteItem.isUpvote ;
    [_btLike setTitle:[NSString stringWithFormat:@"%ld",noteItem.upvoteCnt] forState:0] ;
}


- (IBAction)btCollectOnClick:(UIButton *)sender
{
    sender.selected = !sender.selected ;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectNoteID:addOrRemove:)]) {
        [self.delegate collectNoteID:_noteItem.articleId addOrRemove:sender.selected] ;
    }
}

- (IBAction)btLikeOnClick:(UIButton *)sender
{
    sender.selected = !sender.selected ;
    sender.selected ? ++_noteItem.upvoteCnt : --_noteItem.upvoteCnt ;
    [_btLike setTitle:[NSString stringWithFormat:@"%ld",_noteItem.upvoteCnt] forState:0] ;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(likeNoteID:addOrRemove:)]) {
        [self.delegate likeNoteID:_noteItem.articleId addOrRemove:sender.selected] ;
    }
    
}


+ (CGSize)getSize
{
    // 374 / 500 = w / h
    float width  = ( APP_WIDTH - 3. ) / 2. ;
    float height = width * 500. / 374. ;
    
    return CGSizeMake(width, height) ;
}


@end
