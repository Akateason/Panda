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
        _errCode = [dict[@"err_code"] intValue] ;
        
//        if (_errCode == 10002)
//        {
//            // token失效
//            [CommonFunc exitLog] ;
//        }
        
        _message = dict[@"message"] ;
        _info    = dict[@"info"] ;
    }
//    NSLog(@"errCode : %@",@(_errCode)) ;
//    NSLog(@"message : %@",_message) ;
//    NSLog(@"info    : %@",_info) ;
    return self;
}

@end
