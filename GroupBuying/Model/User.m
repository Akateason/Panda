//
//  User.m
//  SuBaoJiang
//
//  Created by apple on 15/6/5.
//  Copyright (c) 2015年 teason. All rights reserved.
//
#import "DigitInformation.h"
#import "User.h"
#import "CommonFunc.h"

@implementation User

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"u_id" : @"u_id",
             @"u_nickname" : @"u_nickname",
             @"u_headpic" : @"u_headpic",
             @"u_description" : @"u_description",
             @"gender" : @"u_gender"} ;
}

@end


