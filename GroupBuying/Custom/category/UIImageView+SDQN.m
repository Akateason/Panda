//
//  UIImageView+SDQN.m
//  GroupBuying
//
//  Created by TuTu on 16/10/17.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UIImageView+SDQN.h"
#import "UIImageView+WebCache.h"
#import "Pic.h"
#import "UIImage+AddFunction.h"

static NSString *const kQiniuImgStrTail = @"?imageView2/0/w/%d/h/%d/q/100" ;

@implementation UIImageView (SDQN)

- (void)xt_setImageWithPic:(Pic *)pic
{
    [self xt_setImageWithPic:pic
            placeHolderImage:nil] ;
}

- (void)xt_setImageWithPic:(Pic *)pic
          placeHolderImage:(UIImage *)placeHolderImage
{
    NSString *resultStr = [self getUrlStringWithPic:pic] ;
    [self sd_setImageWithURL:[NSURL URLWithString:resultStr]
            placeholderImage:placeHolderImage] ;
}

- (void)xt_setImageWithPic:(Pic *)pic
                 completed:(SDWebImageCompletionBlock)completedBlock ;
{
    [self xt_setImageWithPic:pic
            placeHolderImage:nil
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                          if (completedBlock) {
                              completedBlock(image,error,cacheType,imageURL) ;
                          }
                      }] ;
}

- (void)xt_setImageWithPic:(Pic *)pic
          placeHolderImage:(UIImage *)placeHolderImage
                 completed:(SDWebImageCompletionBlock)completedBlock
{
    NSString *resultStr = [self getUrlStringWithPic:pic] ;

    [self sd_setImageWithURL:[NSURL URLWithString:resultStr]
            placeholderImage:placeHolderImage
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (completedBlock) {
                           completedBlock(image,error,cacheType,imageURL) ;
                       }
                   }] ;
}

- (void)xt_setCircleImageWithPic:(Pic *)pic
                placeHolderImage:(UIImage *)placeHolderImage
{
    NSString *resultStr = [self getUrlStringWithPic:pic] ;
    [self sd_setImageWithURL:[NSURL URLWithString:resultStr]
            placeholderImage:placeHolderImage
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (image == nil) {
                           image = IMG_HEAD_NO ;
                       }
                       else {
                           image = [image imageWithCornerRadius:image.size.width] ;
                       }
                       self.image = image ;
                   }] ;
}



#pragma mark - private

- (NSString *)getUrlStringWithPic:(Pic *)apic
{
    NSString *originUrl = apic.qiniuUrl ;
    if (!originUrl || !originUrl.length) {
        originUrl = apic.nativeUrl ;
    }
    return [self combineResultImageWithOriginalStr:originUrl] ;
}

- (NSString *)combineResultImageWithOriginalStr:(NSString *)strOrigin
{
    NSString *tailStr = [NSString stringWithFormat:kQiniuImgStrTail,(int)CGWidth(self.frame),(int)CGHeight(self.frame)] ;
    return [strOrigin stringByAppendingString:tailStr] ;
}


@end
