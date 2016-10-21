//
//  EditorPhotosCollectionCell.m
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "EditorPhotosCollectionCell.h"
//#import "MaxShapeView.h"
//#import "MaxLightingView.h"
#import "Article.h"
#import "ArticlePicItemInfo.h"


@interface EditorPhotosCollectionCell ()

@property (weak, nonatomic) IBOutlet UIView *imgContainer;
@property (nonatomic,strong)UIImageView     *imageViewBG ;

@end

@implementation EditorPhotosCollectionCell


- (void)setImage:(UIImage *)image
{
    _image = image ;
    
    if (!image) {
        return ;
    }
    self.imageViewBG.image = image ;
}

- (UIImageView *)imageViewBG
{
    if (!_imageViewBG) {
        CGRect rect = CGRectMake(0, 0, APP_WIDTH - 20., APP_HEIGHT - 105 - 44 - 20) ;
        _imageViewBG = [[UIImageView alloc] initWithFrame:rect] ;
        _imageViewBG.userInteractionEnabled = YES ;
        _imageViewBG.image = self.image ;
    }
    return _imageViewBG ;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _imgContainer.backgroundColor = [UIColor clearColor] ;
    [_imgContainer addSubview:self.imageViewBG] ;
}



@end
