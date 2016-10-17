//
//  UIImageView+SDQN.h
//  GroupBuying
//
//  Created by TuTu on 16/10/17.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWebImageManager.h"
@class Pic ;

@interface UIImageView (SDQN)

- (void)xt_setImageWithPic:(Pic *)pic ;

- (void)xt_setImageWithPic:(Pic *)pic
          placeHolderImage:(UIImage *)placeHolderImage ;

- (void)xt_setImageWithPic:(Pic *)pic
                 completed:(SDWebImageCompletionBlock)completedBlock ;

- (void)xt_setImageWithPic:(Pic *)pic
          placeHolderImage:(UIImage *)placeHolderImage
                 completed:(SDWebImageCompletionBlock)completedBlock ;
@end
