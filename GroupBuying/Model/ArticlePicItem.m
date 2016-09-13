//
//  ArticlePicItem.m
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ArticlePicItem.h"
#import "ArticlePicItemInfo.h"

@implementation ArticlePicItem

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"id_ArticlePicItem" : @"id",
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"items" : [ArticlePicItemInfo class]
             
             };
}


@end
