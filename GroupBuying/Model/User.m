//
//  User.m
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "User.h"

@implementation User

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"userId" : @"id" ,
             @"userIdPanda" : @"userId"
             };
}

@end
