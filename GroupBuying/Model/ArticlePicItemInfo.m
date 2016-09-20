//
//  ArticlePicItemInfo.m
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ArticlePicItemInfo.h"

@implementation ArticlePicItemInfo

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"id_ArticlePicItemInfo" : @"id",
             };
}

- (BOOL)positiveOrNagitive
{
    if ([self.posType isEqualToString:@"RIGHT"]) {
        return false ;
    }
    return true ;
}

@end
