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


// 当 JSON 转为 Model 完成后，该方法会被调用。
// 你可以在这里对数据进行校验，如果校验不通过，可以返回 NO，则该 Model 会被忽略。
// 你也可以在这里做一些自动转换不能完成的工作。
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic
{
    _code = [dic[@"code"] intValue];
    if (_code == -53)
    {
        // token失效
        [CommonFunc exitLog] ;
    }
    _data = dic[@"data"] ;

    return YES;
}

//// 当 Model 转为 JSON 完成后，该方法会被调用。
//// 你可以在这里对数据进行校验，如果校验不通过，可以返回 NO，则该 Model 会被忽略。
//// 你也可以在这里做一些自动转换不能完成的工作。
//- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {
//    if (!_createdAt) return NO;
//    dic[@"timestamp"] = @(n.timeIntervalSince1970);
//    return YES;
//}


@end
