//
//  ServerRequest.m
//  JGB
//
//  Created by JGBMACMINI01 on 14-8-12.
//  Copyright (c) 2014年 JGBMACMINI01. All rights reserved.
//

#import "ServerRequest.h"
#import "XTRequest.h"
#import "UrlRequestHeader.h"
#import "DigitInformation.h"
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"
#import "CommonFunc.h"
#import "Article.h"
#import "XTJson.h"
#import "UserOnDevice.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "YYModel.h"
#import "Comment.h"


#define ACCEPTABLE_CONTENT_TYPES        @"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain"



@implementation ServerRequest

#pragma - 登录注册
+ (void)loginWithUserName:(NSString *)name
                 password:(NSString *)password
                  success:(void (^)(id json))success
                     fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:name forKey:@"userName"] ;
    [paramer setObject:password forKey:@"password"] ;

    [XTRequest POSTWithUrl:[self getFinalUrl:URL_USERS_LOGIN]
               parameters:paramer
                  success:^(id json) {
        if (success) success(json);
    } fail:^{
        if (fail) fail();
    }] ;
}

+ (void)registerWithUserName:(NSString *)name
                    password:(NSString *)password
                    nickname:(NSString *)nickname
                     success:(void (^)(id json))success
                        fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:name forKey:@"userName"] ;
    [paramer setObject:password forKey:@"password"] ;
    if (nickname) {
        [paramer setObject:nickname forKey:@"nickName"] ;
    }
    
    [XTRequest POSTWithUrl:[self getFinalUrl:URL_USERS_REGISTER]
               parameters:paramer
                  success:^(id json) {
        if (success) success(json);
    } fail:^{
        if (fail) fail();
    }] ;
}

+ (void)changePasswordWithToken:(NSString *)token
                    oldPassword:(NSString *)oldPassword
                    newPassword:(NSString *)newPassword
                        success:(void (^)(id json))success
                           fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:token forKey:@"token"] ;
    [paramer setObject:oldPassword forKey:@"oldPassword"] ;
    [paramer setObject:newPassword forKey:@"newPassword"] ;
    
    [XTRequest POSTWithUrl:[self getFinalUrl:URL_USERS_PWCHANGE]
                parameters:paramer
                   success:^(id json) {
                       if (success) success(json);
                   }
                      fail:^{
                          if (fail) fail();
                      }] ;
    
}

+ (void)resetPasswordWithIdentifier:(NSString *)identifier
                        newpassword:(NSString *)newPassword
                               code:(NSString *)code
                            success:(void (^)(id json))success
                               fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:identifier forKey:@"identifier"] ;
    [paramer setObject:newPassword forKey:@"newPassword"] ;
    [paramer setObject:code forKey:@"code"] ;
    
    [XTRequest POSTWithUrl:[self getFinalUrl:URL_USERS_RESETPW]
                parameters:paramer
                   success:^(id json) {
                       if (success) success(json);
                   } fail:^{
                       if (fail) fail();
                   }] ;
}

#pragma - 发送验证码
+ (void)sendVerifyCode:(NSString *)identifier
               success:(void (^)(id json))success
                  fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:identifier forKey:@"identifier"] ;
    
    [XTRequest POSTWithUrl:[self getFinalUrl:URL_VERIFYCODE_CREATE]
                parameters:paramer
                   success:^(id json) {
                       if (success) success(json);

                   } fail:^{
                       if (fail) fail();

                   }] ;
}

+ (void)validVerifyCode:(NSString *)identifier
             verifyCode:(NSString *)code
                success:(void (^)(id json))success
                   fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:identifier forKey:@"identifier"] ;
    [paramer setObject:code forKey:@"code"] ;
    
    [XTRequest POSTWithUrl:[self getFinalUrl:URL_VERIFYCODE_VALID]
                parameters:paramer
                   success:^(id json) {
                       if (success) success(json);

                   } fail:^{
                       if (fail) fail();

                   }] ;
}

#pragma - 添加关注
+ (void)addFollowWithUserID:(NSString *)toUserID
                    success:(void (^)(id json))success
                       fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:[UserOnDevice token] forKey:@"token"] ;
    [paramer setObject:toUserID forKey:@"toUserId"] ;
    [XTRequest POSTWithUrl:[self getFinalUrl:URL_FOLLOW_ADD]
                       hud:false
                parameters:paramer
                   success:^(id json) {
                       if (success) success(json);
                   } fail:^{
                       if (fail) fail();
                   }] ;
}

#pragma - 取消关注
+ (void)cancelFollowWithUserID:(NSString *)toUserID
                       success:(void (^)(id json))success
                          fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:[UserOnDevice token] forKey:@"token"] ;
    [paramer setObject:toUserID forKey:@"toUserId"] ;
    [XTRequest POSTWithUrl:[self getFinalUrl:URL_FOLLOW_CANCEL]
                       hud:false
                parameters:paramer
                   success:^(id json) {
                       if (success) success(json);
                   } fail:^{
                       if (fail) fail();
                   }] ;
}

#pragma - 更新用户信息
+ (void)updateUserInfo:(User *)user
               success:(void (^)(id json))success
                  fail:(void (^)())fail
{
    NSString *urlStr = [[self getFinalUrl:URL_USER_UPDATE] stringByAppendingString:[NSString stringWithFormat:@"?token=%@",[UserOnDevice token]]] ;
    NSDictionary *jsonObj = [user yy_modelToJSONObject] ;
    NSLog(@"json : %@",jsonObj) ;
    [XTRequest POSTWithTokenUrl:urlStr
                           body:jsonObj
                        success:^(id json) {
                            if (success) {
                                success(json) ;
                            }
                        }
                           fail:^{
                               if (fail) {
                                   fail() ;
                               }
                           }] ;
}



#pragma -  搜索首页笔记信息
+ (void)homelistWithSearchtype:(NSNumber *)typeNumber
                       refresh:(NSNumber *)refreshNumber
                        userID:(NSString *)userID
                          from:(NSNumber *)from
                       howmany:(NSNumber *)howmany
                       success:(void (^)(id json))success
                          fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:typeNumber forKey:@"searchType"] ;
    [paramer setObject:refreshNumber forKey:@"refresh"] ;
    if (userID != nil) {
        [paramer setObject:userID forKey:@"userId"] ;
    }
    
    [paramer setObject:from forKey:@"from"] ;
    [paramer setObject:howmany forKey:@"howmany"] ;
    
    [XTRequest GETWithUrl:[self getFinalUrl:URL_HOME_LIST_SEARCH]
               parameters:paramer
                  success:^(id json) {
                      if (success) success(json);
                  } fail:^{
                      if (fail) fail();
                  }] ;
    
}

#pragma - 指定文章ID搜索笔记详情信息
+ (void)articleDetailWithArticleID:(NSString *)articleID
                           refresh:(NSNumber *)refreshNumber
                            userID:(NSString *)userID
                           success:(void (^)(id json))success
                              fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:articleID forKey:@"id"] ;
    [paramer setObject:refreshNumber forKey:@"refresh"] ;
    if (userID != nil) {
        [paramer setObject:userID forKey:@"userId"] ;
    }
    
    [XTRequest GETWithUrl:[self getFinalUrl:URL_NOTE_DETAIL]
               parameters:paramer
                  success:^(id json) {
                      if (success) success(json);
                  } fail:^{
                      if (fail) fail();
                  }] ;
    
}

#pragma - 添加文章信息
+ (void)addArticle:(Article *)article
           success:(void (^)(id json))success
              fail:(void (^)())fail
{
    NSString *urlStr = [[self getFinalUrl:URL_ARTICLE_ADD] stringByAppendingString:[NSString stringWithFormat:@"?token=%@",[UserOnDevice token]]] ;
    NSDictionary *jsonObj = [article yy_modelToJSONObject] ;
    
    [XTRequest POSTWithTokenUrl:urlStr
                           body:jsonObj
                        success:^(id json) {
                            if (success) success(json);
                        } fail:^{
                            if (fail) fail();
                        }] ;
}

#pragma - 上传资源
+ (NSURLSessionUploadTask*)uploadTaskWithImage:(UIImage*)image
                                    completion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionBlock
{
    NSString *urlStr = [[self getFinalUrl:URL_RESOURCE_UPLOAD] stringByAppendingString:[NSString stringWithFormat:@"?token=%@",[UserOnDevice token]]] ;

    // 构造 NSURLRequest
    NSError* error = NULL;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST"
                                                                                              URLString:urlStr
                                                                                             parameters:nil
                                                                              constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
                                    {
                                        NSData* dataImg = UIImageJPEGRepresentation(image, 1);
                                        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                                        formatter.dateFormat = @"yyyyMMddHHmmss";
                                        NSString *datestr = [formatter stringFromDate:[NSDate date]] ;
                                        NSString *fileName = [NSString stringWithFormat:@"%@_%@.jpg", datestr,[UserOnDevice currentUserOnDevice].userId] ;
                                        [formData appendPartWithFileData:dataImg
                                                                    name:@"file"
                                                                fileName:fileName
                                                                mimeType:@"image/jpeg"] ;
                                    } error:&error];
    
    // 可在此处配置验证信息
    // 将 NSURLRequest 与 completionBlock 包装为 NSURLSessionUploadTask
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]] ;
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request
                                                                       progress:nil
                                                              completionHandler:completionBlock] ;
    return uploadTask;
}


/*
+ (void)uploadResourceImage:(UIImage *)image
                    success:(void (^)(id responseObject))success
                       fail:(void (^)())fail
{
    NSString *urlStr = [[self getFinalUrl:URL_RESOURCE_UPLOAD] stringByAppendingString:[NSString stringWithFormat:@"?token=%@",[UserOnDevice token]]] ;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager] ;
    [manager              POST:urlStr
                    parameters:nil
       constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSData* dataImg = UIImageJPEGRepresentation(image, 1);
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *datestr = [formatter stringFromDate:[NSDate date]] ;
        NSString *fileName = [NSString stringWithFormat:@"%@_%@.jpg", datestr,[UserOnDevice currentUserOnDevice].idOwn] ;
        [formData appendPartWithFileData:dataImg
                                    name:@"file"
                                fileName:fileName
                                mimeType:@"image/jpeg"] ;
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"上传成功 %@", responseObject);
        if (success) success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"上传失败 %@", error);
        if (fail) fail();
    }] ;
}

+ (void)uploadResourceImages:(NSArray *)images
                    success:(void (^)(id responseObject))success
                       fail:(void (^)())fail
{
    NSString *urlStr = [[self getFinalUrl:URL_RESOURCE_UPLOAD] stringByAppendingString:[NSString stringWithFormat:@"?token=%@",[UserOnDevice token]]] ;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager] ;
    [manager              POST:urlStr
                    parameters:nil
     constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
         
         for (UIImage *image in images) {
             NSData* dataImg = UIImageJPEGRepresentation(image, 1);
             NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
             formatter.dateFormat = @"yyyyMMddHHmmss";
             NSString *datestr = [formatter stringFromDate:[NSDate date]] ;
             NSString *fileName = [NSString stringWithFormat:@"%@_%@.jpg", datestr,[UserOnDevice currentUserOnDevice].idOwn] ;
             [formData appendPartWithFileData:dataImg
                                         name:@"file"
                                     fileName:fileName
                                     mimeType:@"image/jpeg"] ;
         }
         
     } success:^(NSURLSessionDataTask *task, id responseObject) {
         NSLog(@"上传成功 %@", responseObject);
         if (success) success(responseObject);
     } failure:^(NSURLSessionDataTask *task, NSError *error) {
         NSLog(@"上传失败 %@", error);
         if (fail) fail();
     }] ;
}
*/


#pragma mark - 添加点赞信息
+ (void)addLikeWithID:(NSString *)ID
                token:(NSString *)token
              success:(void (^)(id json))success
                 fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:token forKey:@"token"] ;
    [paramer setObject:@"NOTE" forKey:@"objectType"] ;
    [paramer setObject:ID forKey:@"objectId"] ;
    [XTRequest POSTWithUrl:[self getFinalUrl:URL_UPVOTE_ADD]
                       hud:false
                parameters:paramer
                   success:^(id json) {
                       if (success) success(json);
                   } fail:^{
                       if (fail) fail();
                   }] ;
}

#pragma mark - 删除点赞信息
+ (void)removeLikeWithID:(NSString *)ID
                   token:(NSString *)token
                 success:(void (^)(id json))success
                    fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:token forKey:@"token"] ;
    [paramer setObject:@"NOTE" forKey:@"objectType"] ;
    [paramer setObject:ID forKey:@"objectId"] ;
    [XTRequest POSTWithUrl:[self getFinalUrl:URL_UPVOTE_REMOVE]
                       hud:false
                parameters:paramer
                   success:^(id json) {
                       if (success) success(json);
                   } fail:^{
                       if (fail) fail();
                   }] ;
}

#pragma mark - 添加收藏信息
+ (void)addFavoriteWithID:(NSString *)ID
                  success:(void (^)(id json))success
                     fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:[UserOnDevice token] forKey:@"token"] ;
    [paramer setObject:@"NOTE" forKey:@"objectType"] ;
    [paramer setObject:ID forKey:@"objectId"] ;
    
    [XTRequest POSTWithUrl:[self getFinalUrl:URL_FAVORITE_ADD]
                       hud:false
                parameters:paramer
                   success:^(id json) {
                       if (success) success(json);
                   } fail:^{
                       if (fail) fail();
                   }] ;
}

#pragma mark - 删除收藏信息
+ (void)removeFavoriteWithID:(NSString *)ID
                     success:(void (^)(id json))success
                        fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:[UserOnDevice token] forKey:@"token"] ;
    [paramer setObject:@"NOTE" forKey:@"objectType"] ;
    [paramer setObject:ID forKey:@"objectId"] ;

    [XTRequest POSTWithUrl:[self getFinalUrl:URL_FAVORITE_REMOVE]
                       hud:false
                parameters:paramer
                   success:^(id json) {
                       if (success) {
                           success(json) ;
                       }
                   } fail:^{
                       if (fail) {
                           fail() ;
                       }
                   }] ;
}

#pragma mark - 搜索文章标签信息
+ (NSURLSessionDataTask *)searchArticleTagWithSearchKey:(NSString *)searchKey
                                                manager:(AFHTTPSessionManager *)manager
                                                success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                                   fail:(void (^)(NSURLSessionDataTask *task, NSError *error))fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:@"NOTE" forKey:@"type"] ;
    [paramer setObject:searchKey forKey:@"searchKey"] ;
    
    NSURLSessionDataTask *task = [manager GET:[self getFinalUrl:URL_ARTICLETAG_SEARCH]
                                   parameters:paramer
                                      success:^(NSURLSessionDataTask *task, id responseObject) {
                                           if (success) success(task,responseObject) ;
                                      } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                           if (fail) fail(task,error) ;
                                       }] ;
    return task ;
}


#pragma mark - 添加评论信息
+ (void)addComment:(Comment *)comment
           success:(void (^)(id json))success
              fail:(void (^)())fail
{
    NSString *urlStr = [[self getFinalUrl:URL_COMMENT_ADD] stringByAppendingString:[NSString stringWithFormat:@"?token=%@",[UserOnDevice token]]] ;
    NSDictionary *jsonObj = [comment yy_modelToJSONObject] ;
    
    [XTRequest POSTWithTokenUrl:urlStr
                           body:jsonObj
                        success:^(id json) {
                            if (success) success(json);
                        } fail:^{
                            if (fail) fail();
                        }] ;
}

#pragma mark - 指定对象ID搜索评论信息
+ (void)getCommentsListByObjectId:(NSString *)objectId
                             From:(int)from
                          howmany:(int)howmany
                          refresh:(int)refresh
                          success:(void (^)(id json))success
                             fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:@"NOTE" forKey:@"objectType"] ;
    [paramer setObject:objectId forKey:@"objectId"] ;
    [paramer setObject:@(from) forKey:@"from"] ;
    [paramer setObject:@(howmany) forKey:@"howmany"] ;
    [paramer setObject:@(refresh) forKey:@"refresh"] ;
    
    [XTRequest GETWithUrl:[self getFinalUrl:URL_COMMENT_SEARCHBYID]
               parameters:paramer
                  success:^(id json) {
                      if (success) success(json);
                  } fail:^{
                      if (fail) fail();
                  }] ;
    
}








#pragma mark - private

+ (NSString *)getFinalUrl:(NSString *)urlstr
{
    NSString *str = [G_IP_SERVER stringByAppendingString:urlstr] ;
    return str ;
}

+ (NSMutableDictionary *)getParameters
{
    return [NSMutableDictionary dictionary] ;
}



@end
