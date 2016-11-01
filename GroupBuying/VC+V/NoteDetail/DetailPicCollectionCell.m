//
//  DetailPicCollectionCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/1.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DetailPicCollectionCell.h"
#import "ArticlePicItem.h"
#import "ArticlePicItemInfo.h"
#import "UIImageView+SDQN.h"
#import "MaxShapeView.h"

@interface DetailPicCollectionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end

@implementation DetailPicCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

- (void)setPicItem:(ArticlePicItem *)picItem
{
    _picItem = picItem ;
    
    if (!_picItem) return ;    
    
    [_imgView xt_setImageWithPic:picItem.img
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                           
                           for (int i = 0; i < picItem.items.count; i++)
                           {
                               ArticlePicItemInfo *itemInfo = picItem.items[i] ;
                               
                               MaxShapeView *tagView = [[MaxShapeView alloc] initWithFrame:CGRectZero
                                                                                     point:CGPointMake(itemInfo.posX, itemInfo.posY)
                                                                                  tagGroup:[itemInfo tagGroup]
                                                                                   tagType:kMaxTagGroupTypeDefault
                                                                                superFrame:self.imgView.frame] ;
                               tagView.itemInfo = itemInfo ;
                               
                               [self.imgView addSubview:tagView] ;
                           }
                           
                       }] ;
    
}

@end
