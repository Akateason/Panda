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

















#pragma mark - private
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


@end
