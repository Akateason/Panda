//
//  ResultParsered.m
//  SuBaoJiang
//
//  Created by apple on 15/6/4.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#import "ResultParsered.h"
#import "CommonFunc.h"

@implementation ResultParsered

- (instancetype)initWithDic:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        _code = [dict[@"code"] intValue] ;
        if (_code == -53)
        {
            // token失效
            [CommonFunc exitLog] ;
        }
        _data = dict[@"data"] ;
    }

    return self;
}

@end
