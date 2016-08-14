//
//  ArticleComment.m
//  SuBaoJiang
//
//  Created by apple on 15/6/5.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#import "ArticleComment.h"
#import "User.h"
#import "XTTickConvert.h"
#import "DigitInformation.h"

@implementation ArticleComment

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"c_id" : @"c_id" ,
             @"c_content" : @"c_content" ,
             @"c_color" : @"c_color" ,
             @"c_size" : @"c_size" ,
             @"c_position" : @"c_position" ,
             @"c_createtime" : @"c_createtime" ,
             @"is_author" : @"is_author" ,
             @"reply_u_id" : @"reply_u_id" ,
             @"a_id" : @"a_id" ,
             @"img" : @"img" ,
             @"reply_u_nickname" : @"reply_u_nickname" ,
             } ;
}

@end
