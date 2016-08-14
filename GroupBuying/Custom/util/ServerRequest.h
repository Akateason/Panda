//
//  ServerRequest.h
//  JGB
//
//  Created by JGBMACMINI01 on 14-8-12.
//  Copyright (c) 2014年 JGBMACMINI01. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "XTRequest.h"
#import "ResultParsered.h"
#import "PublicEnum.h"
@class User ;

@interface ServerRequest : XTRequest

/** 取七牛token
 bucket	必填参数	存储空间
 */
+ (void)getQiniuTokenWithBuckect:(NSString *)bucket
                         success:(void (^)(id json))success
                            fail:(void (^)())fail ;

+ (ResultParsered *)getQiniuTokenWithBuckect:(NSString *)bucket ;

#pragma mark -- 首页
/** 获取首页
 since_id	选填参数	若指定此参数，则返回ID比since_id大的评论（即比since_id时间晚的评论），默认为0
 max_id     选填参数	若指定此参数，则返回ID小于或等于max_id的评论，默认为0。
 count      选填参数	单页返回的记录条数，默认为50。
 */
+ (ResultParsered *)getHomePageInfoResultWithSinceID:(int)sinceID
                                            AndMaxID:(long long)maxID
                                            AndCount:(int)count ;


@end





