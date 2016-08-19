//
//  HPBigPhotoCollectionCell.m
//  GroupBuying
//
//  Created by teason on 16/8/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HPBigPhotoCollectionCell.h"

@interface HPBigPhotoCollectionCell ()



@end

@implementation HPBigPhotoCollectionCell

+ (CGSize)getSize
{
    float height = 70. + APP_WIDTH * 500. / 374. + 75. ;
    
    return CGSizeMake(APP_WIDTH, height) ;
}


@end
