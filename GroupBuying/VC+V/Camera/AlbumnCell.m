//
//  AlbumnCell.m
//  SuBaoJiang
//
//  Created by apple on 15/6/24.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#import "AlbumnCell.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface AlbumnCell ()
//UIs
@property (weak, nonatomic) IBOutlet UIImageView *img_takePhoto;
@property (weak, nonatomic) IBOutlet UIImageView *img_picSelect;
@property (weak, nonatomic) IBOutlet UILabel *labelTakephoto;

@end

@implementation AlbumnCell

#pragma mark --
#pragma mark - Inital
- (void)awakeFromNib
{
//    _img.backgroundColor = COLOR_HEADER_BACK ;
    _img.contentMode = UIViewContentModeScaleAspectFit ;
    _img_takePhoto.hidden = YES ;
    _img_picSelect.hidden = NO ;
}

#pragma mark --
#pragma mark - Prop
- (void)setBTakePhoto:(BOOL)bTakePhoto
{
    _bTakePhoto = bTakePhoto ;
    
    _img_takePhoto.hidden = !bTakePhoto ;
    _labelTakephoto.hidden = !bTakePhoto ;
    _img.hidden = bTakePhoto ;
    _img_picSelect.hidden = bTakePhoto ;
    self.layer.borderColor = [UIColor blackColor].CGColor ;
    self.layer.borderWidth = bTakePhoto ? 5. : 0. ;
    
}

//- (void)setFetchMode:(Mode_SingleOrMultiple)fetchMode
//{
//    _fetchMode = fetchMode ;
//    
//    _img_picSelect.hidden = (fetchMode == mode_single || fetchMode == mode_addSingle) ;
//}

- (void)setPicSelected:(BOOL)picSelected
{
    _picSelected = picSelected ;
    
    NSString *imgStr = picSelected ? @"cvc_pic_select_s" : @"cvc_pic_select_n" ;
    _img_picSelect.image = [UIImage imageNamed:imgStr] ;
}

#pragma mark --
#pragma mark - 

+ (CGSize)getSize
{
    float collectionSlider = ( APPFRAME.size.width - kCOLUMN_FLEX * ((float)kCOLUMN_NUMBER + 1) ) / (float)kCOLUMN_NUMBER ;
    return CGSizeMake(collectionSlider, collectionSlider) ;
}

@end
