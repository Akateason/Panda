//
//  DetailCoverTitleCell.m
//  GroupBuying
//
//  Created by teason on 16/9/10.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DetailCoverTitleCell.h"
#import "NoteDetailViewItem.h"
#import "Article.h"
#import "Pic.h"
#import "MaxShapeView.h"
#import "MaxLightingView.h"
#import "Article.h"
#import "ArticlePicItem.h"
#import "ArticlePicItemInfo.h"
#import "Pic.h"
#import "UIImageView+SDQN.h"

@interface DetailCoverTitleCell ()

@property (weak, nonatomic) IBOutlet UIView *imgContainer;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptLabel;
@property (weak, nonatomic) IBOutlet UIView *sepline;

// code
@property (nonatomic,strong)UIImageView           *imageViewBG ;

@end


@implementation DetailCoverTitleCell

+ (CGFloat)getHeightWithNoteItem:(NoteDetailViewItem *)noteItem
{
    float imgH = APP_WIDTH * 500. / 374. ;
    
    CGFloat titleHeight = 0.;
    if (noteItem.articleInfo.title.length)
    {
        UIFont *fontTitle = [UIFont systemFontOfSize:14] ;
        CGSize sizeTitle = CGSizeMake(APP_WIDTH - 2 * 12., 100.) ;
        CGSize titlelabelSize = [noteItem.articleInfo.title boundingRectWithSize:sizeTitle
                                                                         options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                                      attributes:@{NSFontAttributeName:fontTitle}
                                                                         context:nil].size ;
        titleHeight = titlelabelSize.height ;
    }
    

    UIFont *fontContent= [UIFont systemFontOfSize:13] ;
    CGSize sizeContent = CGSizeMake(APP_WIDTH - 2 * 12., 1000.) ;
    CGSize contentLabelSize = [noteItem.articleInfo.content boundingRectWithSize:sizeContent
                                                                     options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                                  attributes:@{NSFontAttributeName:fontContent}
                                                                     context:nil].size ;
    CGFloat contentHeight = contentLabelSize.height ;
    
    
    return imgH + 10. + titleHeight + 14 + contentHeight + 10 + 15 ;
}

#pragma mark - prop
- (void)setNoteItem:(NoteDetailViewItem *)noteItem
{
    _noteItem = noteItem ;
    
    if (!noteItem) return ;
    
    
    _titleLabel.text = noteItem.articleInfo.title ;
    _descriptLabel.text = noteItem.articleInfo.content ;
    
    ArticlePicItem *itemWillDisplay = [noteItem.articleInfo.picItems firstObject] ;
    
    [self.imageViewBG xt_setImageWithPic:itemWillDisplay.img
                               completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                   
                                   for (int i = 0; i < itemWillDisplay.items.count; i++)
                                   {
                                       ArticlePicItemInfo *itemInfo = itemWillDisplay.items[i] ;
                                       
                                       MaxShapeView *tagView = [[MaxShapeView alloc] initWithFrame:CGRectZero
                                                                                             point:CGPointMake(itemInfo.posX, itemInfo.posY)
                                                                                          tagGroup:[itemInfo tagGroup]
                                                                                           tagType:kMaxTagGroupTypeDefault
                                                                                        superFrame:self.imageViewBG.frame] ;
                                       tagView.itemInfo = itemInfo ;
                                       
                                       [self.imageViewBG addSubview:tagView] ;
                                       
                                   }

                               }] ;
}


- (UIImageView *)imageViewBG
{
    if (!_imageViewBG) {
        CGRect rect = CGRectZero ;
        rect.size = CGSizeMake(APP_WIDTH, APP_WIDTH * 1000 / 750) ;
        _imageViewBG = [[UIImageView alloc] initWithFrame:rect] ;
    }
    return _imageViewBG ;
}



- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor whiteColor] ;
    _imgContainer.backgroundColor = [UIColor whiteColor] ;
    
    // Initialization code
    _titleLabel.textColor = [UIColor xt_w_dark] ;
    _descriptLabel.textColor = [UIColor xt_w_content] ;
    _sepline.backgroundColor = [UIColor xt_seperate] ;
    
    [_imgContainer addSubview:self.imageViewBG] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
