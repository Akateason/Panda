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
//#import "User.h"
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"
#import "CommonFunc.h"

@implementation ServerRequest

//privace
+ (NSString *)getFinalUrl:(NSString *)urlstr
{
    NSString *str = [G_IP_SERVER stringByAppendingString:urlstr] ;
    return [self appendTokenWithUrl:str] ;
}

+ (NSString *)appendTokenWithUrl:(NSString *)url
{
    NSString *urltoken = [G_TOKEN length] ? [NSString stringWithFormat:@"?token=%@",G_TOKEN] : @"?token=0";
    return [url stringByAppendingString:urltoken] ;
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


/** 取七牛token
 bucket	必填参数	存储空间
 */
+ (void)getQiniuTokenWithBuckect:(NSString *)bucket
                         success:(void (^)(id json))success
                            fail:(void (^)())fail
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:bucket forKey:@"bucket"] ;
    
    [XTRequest GETWithUrl:[self getFinalUrl:URL_QINIU_TOKEN] parameters:paramer success:^(id json) {
        if (success) success(json);
    } fail:^{
        if (fail) fail();
    }] ;
}

+ (ResultParsered *)getQiniuTokenWithBuckect:(NSString *)bucket
{
    NSMutableDictionary *paramer = [self getParameters] ;
    [paramer setObject:bucket forKey:@"bucket"] ;

    return [self getJsonWithURLstr:[self getFinalUrl:URL_QINIU_TOKEN] AndWithParamer:paramer AndWithMode:GET_MODE] ;
}



#pragma mark - 首页

/** 获取首页
 since_id	选填参数	若指定此参数，则返回ID比since_id大的评论（即比since_id时间晚的评论），默认为0
 max_id     选填参数	若指定此参数，则返回ID小于或等于max_id的评论，默认为0。
 count      选填参数	单页返回的记录条数，默认为50。
 */
+ (ResultParsered *)getHomePageInfoResultWithSinceID:(int)sinceID
                                            AndMaxID:(long long)maxID
                                            AndCount:(int)count
{
    NSMutableDictionary *paramer = [self getParameters] ;
    
    [paramer setObject:[NSNumber numberWithLongLong:maxID]
                forKey:@"max_id"] ;
    [paramer setObject:[NSNumber numberWithInt:sinceID]
                forKey:@"since_id"] ;
    [paramer setObject:[NSNumber numberWithInt:count]
                forKey:@"count"] ;
    
    return [self getJsonWithURLstr:[self getFinalUrl:URL_HOMEPAGE_GETINFO] AndWithParamer:paramer AndWithMode:GET_MODE] ;    
}




#pragma mark -- 登陆注册
/**
 category	用户分类，1为微信，2为微博，3为用户名密码登录
 wxopenid	微信openid
 wxunionid	微信unionid
 nickname	昵称
 gender	性别
 language	语言
 country	国家
 province	省份
 city	城市
 headpic	头像
 wbuid	微博用户uid
 description	微博用户简介
 uuid	设备唯一标示符
 username| 用户登录账号
 password| 登录密码
 */
//+ (ResultParsered *)loginUnitWithCategory:(MODE_LOGIN_CATE)cateMode
//                                 wxopenID:(NSString *)wxopenid
//                                wxUnionID:(NSString *)wxunionid
//                                 nickName:(NSString *)nickname
//                                   gender:(NSNumber *)gender
//                                 language:(NSString *)language
//                                  country:(NSString *)country
//                                 province:(NSString *)province
//                                     city:(NSString *)city
//                                  headpic:(NSString *)headpic
//                                    wbuid:(NSString *)wbuid
//                              description:(NSString *)description
//                                 username:(NSString *)username
//                                 password:(NSString *)password
//{
//    NSString *uuid = [DigitInformation shareInstance].uuid ; // udid ;
//    
//    NSMutableDictionary *paramer = [self getParameters] ;
//    
//    [paramer setObject:[NSNumber numberWithInt:cateMode]
//                forKey:@"category"] ;
//    if (wxopenid) [paramer setObject:wxopenid forKey:@"wxopenid"] ;
//    if (wxunionid) [paramer setObject:wxunionid forKey:@"wxunionid"] ;
//    if (nickname) [paramer setObject:nickname forKey:@"nickname"] ;
//    if (gender) [paramer setObject:gender forKey:@"gender"] ;
//    if (language) [paramer setObject:language forKey:@"language"] ;
//    if (country) [paramer setObject:country forKey:@"country"] ;
//    if (province) [paramer setObject:province forKey:@"province"] ;
//    if (city) [paramer setObject:city forKey:@"city"] ;
//    if (headpic) [paramer setObject:headpic forKey:@"headpic"] ;
//    if (wbuid) [paramer setObject:wbuid forKey:@"wbuid"] ;
//    if (description) [paramer setObject:description forKey:@"description"] ;
//    if (uuid) [paramer setObject:uuid forKey:@"uuid"] ;
//    if (username) [paramer setObject:username forKey:@"username"] ;
//    if (password) [paramer setObject:password forKey:@"password"] ;
//    
//    return [self getJsonWithURLstr:[self getFinalUrl:URL_LOGIN_UNION] AndWithParamer:paramer AndWithMode:POST_MODE] ;
//}
//
//
//+ (void)loginUnitWithCategory:(MODE_LOGIN_CATE)cateMode
//                     wxopenID:(NSString *)wxopenid
//                    wxUnionID:(NSString *)wxunionid
//                     nickName:(NSString *)nickname
//                       gender:(NSNumber *)gender
//                     language:(NSString *)language
//                      country:(NSString *)country
//                     province:(NSString *)province
//                         city:(NSString *)city
//                      headpic:(NSString *)headpic
//                        wbuid:(NSString *)wbuid
//                  description:(NSString *)description
//                     username:(NSString *)username
//                     password:(NSString *)password
//                      Success:(void (^)(id json))success
//                         fail:(void (^)())fail
//{
//    NSString *uuid = [DigitInformation shareInstance].uuid ; // udid ;
//    
//    NSMutableDictionary *paramer = [self getParameters] ;
//    
//    [paramer setObject:[NSNumber numberWithInt:cateMode]
//                forKey:@"category"] ;
//    if (wxopenid) [paramer setObject:wxopenid forKey:@"wxopenid"] ;
//    if (wxunionid) [paramer setObject:wxunionid forKey:@"wxunionid"] ;
//    if (nickname) [paramer setObject:nickname forKey:@"nickname"] ;
//    if (gender) [paramer setObject:gender forKey:@"gender"] ;
//    if (language) [paramer setObject:language forKey:@"language"] ;
//    if (country) [paramer setObject:country forKey:@"country"] ;
//    if (province) [paramer setObject:province forKey:@"province"] ;
//    if (city) [paramer setObject:city forKey:@"city"] ;
//    if (headpic) [paramer setObject:headpic forKey:@"headpic"] ;
//    if (wbuid) [paramer setObject:wbuid forKey:@"wbuid"] ;
//    if (description) [paramer setObject:description forKey:@"description"] ;
//    if (uuid) [paramer setObject:uuid forKey:@"uuid"] ;
//    if (username) [paramer setObject:username forKey:@"username"] ;
//    if (password) [paramer setObject:password forKey:@"password"] ;
//   
//    [XTRequest POSTWithUrl:[self getFinalUrl:URL_LOGIN_UNION] parameters:paramer success:^(id json) {
//        if (success) success(json);
//    } fail:^{
//        if (fail) fail();
//    }] ;
//    
//}
//
///**
// 第三方注册
// username	必填参数	用户名
// password	必填参数	密码
// */
//+ (void)loginRegisterUsername:(NSString *)username
//                     password:(NSString *)password
//                      Success:(void (^)(id json))success
//                         fail:(void (^)())fail
//{
//    NSMutableDictionary *paramer = [self getParameters] ;
//    
//    [paramer setObject:username
//                forKey:@"username"] ;
//    [paramer setObject:password
//                forKey:@"password"] ;
//    
//    [XTRequest POSTWithUrl:[self getFinalUrl:URL_LOGIN_REGISTER] parameters:paramer success:^(id json) {
//        if (success) success(json);
//    } fail:^{
//        if (fail) fail();
//    }] ;
//
//}
//

@end
