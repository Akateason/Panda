//
//  ArticlePraise.m
//  SuBaoJiang
//
//  Created by apple on 15/6/8.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#import "ArticlePraise.h"
#import "User.h"

@implementation ArticlePraise

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ao_id" : @"ao_id",
             
             @"user" : @"" ,
             
             @"img" : @"img",
             @"a_id" : @"a_id",
             @"author_id" : @"author_id",
             @"p_createtime" : @"p_createtime"};
}

//- (instancetype)initWithDict:(NSDictionary *)dict
//{
//    self = [super init];
//    if (self) {
//        _ao_id = [[dict objectForKey:@"ao_id"] intValue];
//        _user = [[User alloc] initWithDic:dict] ;
//        
//        _img = [dict objectForKey:@"img"] ;
//        _a_id = [[dict objectForKey:@"a_id"] intValue] ;
//        _author_id = [[dict objectForKey:@"author_id"] intValue] ;
//        _p_createTime = [[dict objectForKey:@"p_createtime"] longLongValue] ;
//    }
//    return self;
//}


@end
