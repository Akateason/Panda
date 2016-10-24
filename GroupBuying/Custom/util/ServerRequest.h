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
@class User,Article,AFHTTPSessionManager,Comment ;

@interface ServerRequest : XTRequest

////////////////////////////////////////////////////////////////////////////////////////////////////////
// 用户
#pragma - 登录注册
+ (void)loginWithUserName:(NSString *)name
                 password:(NSString *)password
                  success:(void (^)(id json))success
                     fail:(void (^)())fail ;

+ (void)registerWithUserName:(NSString *)name
                    password:(NSString *)password
                    nickname:(NSString *)nickname
                     success:(void (^)(id json))success
                        fail:(void (^)())fail ;

+ (void)changePasswordWithToken:(NSString *)token
                    oldPassword:(NSString *)oldPassword
                    newPassword:(NSString *)newPassword
                        success:(void (^)(id json))success
                           fail:(void (^)())fail ;

+ (void)resetPasswordWithIdentifier:(NSString *)identifier
                        newpassword:(NSString *)newPassword
                               code:(NSString *)code
                            success:(void (^)(id json))success
                               fail:(void (^)())fail ;

+ (void)sendVerifyCode:(NSString *)identifier
               success:(void (^)(id json))success
                  fail:(void (^)())fail ;

+ (void)validVerifyCode:(NSString *)identifier
             verifyCode:(NSString *)code
                success:(void (^)(id json))success
                   fail:(void (^)())fail ;

#pragma - 添加关注
+ (void)addFollowWithUserID:(NSString *)toUserID
                    success:(void (^)(id json))success
                       fail:(void (^)())fail ;

#pragma - 取消关注
+ (void)cancelFollowWithUserID:(NSString *)toUserID
                       success:(void (^)(id json))success
                          fail:(void (^)())fail ;

#pragma - 更新用户信息
+ (void)updateUserInfo:(User *)user
               success:(void (^)(id json))success
                  fail:(void (^)())fail ;

////////////////////////////////////////////////////////////////////////////////////////////////////////
// 笔记
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

#pragma - 上传资源
+ (NSURLSessionUploadTask*)uploadTaskWithImage:(UIImage*)image
                                    completion:(void (^)(NSURLResponse *response,
                                                         id responseObject,
                                                         NSError *error))completionBlock ;

#pragma mark - 添加点赞信息
+ (void)addLikeWithID:(NSString *)ID
                token:(NSString *)token
              success:(void (^)(id json))success
                 fail:(void (^)())fail ;

#pragma mark - 删除点赞信息
+ (void)removeLikeWithID:(NSString *)ID
                   token:(NSString *)token
                 success:(void (^)(id json))success
                    fail:(void (^)())fail ;

#pragma mark - 添加收藏信息
+ (void)addFavoriteWithID:(NSString *)ID
                  success:(void (^)(id json))success
                     fail:(void (^)())fail ;

#pragma mark - 删除收藏信息
+ (void)removeFavoriteWithID:(NSString *)ID
                     success:(void (^)(id json))success
                        fail:(void (^)())fail ;


#pragma mark - 搜索文章标签信息
+ (NSURLSessionDataTask *)searchArticleTagWithSearchKey:(NSString *)searchKey
                                                manager:(AFHTTPSessionManager *)manager
                                                success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                                   fail:(void (^)(NSURLSessionDataTask *task, NSError *error))fail ;

#pragma mark - 添加评论信息
+ (void)addComment:(Comment *)comment
           success:(void (^)(id json))success
              fail:(void (^)())fail ;

#pragma mark - 指定对象ID搜索评论信息
+ (void)getCommentsListByObjectId:(NSString *)objectId
                             From:(int)from
                          howmany:(int)howmany
                          refresh:(int)refresh
                          success:(void (^)(id json))success
                             fail:(void (^)())fail ;




////////////////////////////////////////////////////////////////////////////////////////////////////////

@end





