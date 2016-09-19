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



#pragma -  搜索首页笔记信息
+ (void)homelistWithSearchtype:(NSNumber *)typeNumber
                       refresh:(NSNumber *)refreshNumber
                        userID:(NSString *)userID
                          from:(NSNumber *)from
                       howmany:(NSNumber *)howmany
                       success:(void (^)(id json))success
                          fail:(void (^)())fail ;


#pragma - 指定文章ID搜索笔记详情信息
+ (void)articleDetailWithArticleID:(NSString *)articleID
                           refresh:(NSNumber *)refreshNumber
                            userID:(NSString *)userID
                           success:(void (^)(id json))success
                              fail:(void (^)())fail ;




#pragma - 添加文章信息
+ (void)addArticle:(Article *)article
           success:(void (^)(id json))success
              fail:(void (^)())fail ;
// 上传资源
+ (NSURLSessionUploadTask*)uploadTaskWithImage:(UIImage*)image
                                    completion:(void (^)(NSURLResponse *response,
                                                         id responseObject,
                                                         NSError *error))completionBlock ;


@end





