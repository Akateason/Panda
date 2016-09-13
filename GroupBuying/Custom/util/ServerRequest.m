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
