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

#define ACCEPTABLE_CONTENT_TYPES        @"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain"



@implementation ServerRequest

#pragma mark -
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
                     success:(void (^)(id json))success
                        fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:name forKey:@"userName"] ;
    [paramer setObject:password forKey:@"password"] ;
    
    [XTRequest POSTWithUrl:[self getFinalUrl:URL_USERS_REGISTER]
               parameters:paramer
                  success:^(id json) {
        if (success) success(json);
    } fail:^{
        if (fail) fail();
    }] ;
}


+ (void)addArticle:(Article *)article
           success:(void (^)(id json))success
              fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    NSString *jsonStr = [XTJson getJsonStr:article] ;
    [paramer setObject:jsonStr forKey:@"request_body"] ;
    [paramer setObject:[UserOnDevice token] forKey:@"token"] ;
    [XTRequest POSTWithUrl:[self getFinalUrl:URL_ARTICLE_ADD]
                parameters:paramer
                   success:^(id json) {
                       if (success) success(json);
                   } fail:^{
                       if (fail) fail();
                   }] ;

}

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
                                        NSString *fileName = [NSString stringWithFormat:@"%@_%@.jpg", datestr,[UserOnDevice currentUserOnDevice].idOwn] ;
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

/*
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

//+ (void)getQiniuTokenWithBuckect:(NSString *)bucket
//                         success:(void (^)(id json))success
//                            fail:(void (^)())fail
//{
//    NSMutableDictionary *paramer = [self getParameters] ;
//    [paramer setObject:bucket forKey:@"bucket"] ;
//    
//    [XTRequest GETWithUrl:[self getFinalUrl:URL_QINIU_TOKEN] parameters:paramer success:^(id json) {
//        if (success) success(json);
//    } fail:^{
//        if (fail) fail();
//    }] ;
//}
//
//+ (ResultParsered *)getQiniuTokenWithBuckect:(NSString *)bucket
//{
//    NSMutableDictionary *paramer = [self getParameters] ;
//    [paramer setObject:bucket forKey:@"bucket"] ;
//
//    return [self getJsonWithURLstr:[self getFinalUrl:URL_QINIU_TOKEN] AndWithParamer:paramer AndWithMode:GET_MODE] ;
//}

















#pragma mark - private
//privace
+ (NSString *)getFinalUrl:(NSString *)urlstr
{
    NSString *str = [G_IP_SERVER stringByAppendingString:urlstr] ;
    return str ;
}



/**
 @paramer : bToken 是否要传token
 */
+ (NSMutableDictionary *)getParameters
{
    return [NSMutableDictionary dictionary] ;
}

+ (NSString *)getToken
{
    return [G_TOKEN length] ? G_TOKEN : @"0" ;
}


@end
