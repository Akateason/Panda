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
@class User,Article ;

@interface ServerRequest : XTRequest

#pragma - 登录注册
+ (void)loginWithUserName:(NSString *)name
                 password:(NSString *)password
                  success:(void (^)(id json))success
                     fail:(void (^)())fail ;


+ (void)registerWithUserName:(NSString *)name
                    password:(NSString *)password
                     success:(void (^)(id json))success
                        fail:(void (^)())fail ;

#pragma - 添加文章信息
+ (void)addArticle:(Article *)article
           success:(void (^)(id json))success
              fail:(void (^)())fail ;

// 上传资源
+ (void)uploadResourceImage:(UIImage *)image
                    success:(void (^)(id responseObject))success
                       fail:(void (^)())fail ;
@end





