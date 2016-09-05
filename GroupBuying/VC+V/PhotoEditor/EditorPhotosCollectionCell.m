//
//  EditorPhotosCollectionCell.m
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "EditorPhotosCollectionCell.h"


@interface EditorPhotosCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation EditorPhotosCollectionCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _imgView.backgroundColor = [UIColor clearColor] ;
}


- (void)setImage:(UIImage *)image
{
    _image = image ;
    
    self.imgView.image = image ;
}

@end
