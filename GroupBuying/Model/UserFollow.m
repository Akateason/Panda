//
//  UserFollow.m
//  GroupBuying
//
//  Created by TuTu on 16/10/27.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UserFollow.h"

@implementation UserFollow


+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"isUser" : @"id" ,
             };
}

@end
