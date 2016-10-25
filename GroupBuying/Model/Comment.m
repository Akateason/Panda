//
//  Comment.m
//  GroupBuying
//
//  Created by TuTu on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "Comment.h"
#import "Pic.h"

@implementation Comment

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"idComment" : @"id",
             };
}

@end
