//
//  PostPhotoCollectionCell.m
//  GroupBuying
//
//  Created by TuTu on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PostPhotoCollectionCell.h"
#import "UIImage+AddFunction.h"

@interface PostPhotoCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *btDelete;

@end

@implementation PostPhotoCollectionCell

- (IBAction)btDeleteOnClick:(id)sender
{
    NSLog(@"删除图片") ;    
    if (self.delegate && [self.delegate respondsToSelector:@selector(deleteImagesWithIndex:)]) {
        [self.delegate deleteImagesWithIndex:self.index] ;
    }
    
}

- (void)setImage:(UIImage *)image
{
    _image = image ;
    
    self.imgView.image = [UIImage thumbnailWithImage:image size:CGSizeMake(90, 90)];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
