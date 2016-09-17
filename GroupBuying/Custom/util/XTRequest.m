//
//  AppDelegate.m
//  XTRequest
//
//  Created by TuTu on 15/11/12.
//  Copyright © 2015年 teason. All rights reserved.
//

#import "XTRequest.h"
#import "AFNetworking.h"
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"
#import "AppDelegate.h"
#import "SVProgressHUD.h"

#define ACCEPTABLE_CONTENT_TYPES        @"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain"

@implementation XTRequest

+ (void)netWorkStatus
{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // WiFi
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"网络状态 : %@", @(status)) ;
    }];
}

+ (void)GETWithUrl:(NSString *)url
        parameters:(NSDictionary *)dict
           success:(void (^)(id json))success
              fail:(void (^)())fail
{
    [self GETWithUrl:url hud:YES parameters:dict success:success fail:fail] ;
}

+ (void)GETWithUrl:(NSString *)url
               hud:(BOOL)hud
        parameters:(NSDictionary *)dict
           success:(void (^)(id json))success
              fail:(void (^)())fail
{
    if (hud) {
        [SVProgressHUD show] ;
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = TIMEOUT ;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:ACCEPTABLE_CONTENT_TYPES,nil];//设置相应内容类型
    [manager GET:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            NSLog(@"url : %@ \nparam : %@",url,dict) ;
            NSLog(@"resp %@",responseObject) ;
            success(responseObject);
            if (hud) {
                [SVProgressHUD dismiss] ;
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error:%@", error);
        if (fail) {
            fail();
            if (hud) {
                [SVProgressHUD dismiss] ;
            }
        }
    }];
}

+ (void)POSTWithUrl:(NSString *)url
                hud:(BOOL)hud
         parameters:(NSDictionary *)dict
            success:(void (^)(id json))success
               fail:(void (^)())fail
{
    if (hud) {
        [SVProgressHUD show] ;
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:ACCEPTABLE_CONTENT_TYPES,nil];//设置相应内容类型
    manager.requestSerializer.timeoutInterval = TIMEOUT ;
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            NSLog(@"url : %@ \nparam : %@",url,dict) ;
            NSLog(@"resp %@",responseObject) ;
            success(responseObject) ;
            if (hud) {
                [SVProgressHUD dismiss] ;
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error) ;
        if (fail) {
            fail();
            if (hud) {
                [SVProgressHUD dismiss] ;
            }
        }
    }];

}

+ (void)POSTWithUrl:(NSString *)url
         parameters:(NSDictionary *)dict
            success:(void (^)(id json))success
               fail:(void (^)())fail
{
    [self POSTWithUrl:url hud:YES parameters:dict success:success fail:fail] ;
}

+ (void)POSTWithTokenUrl:(NSString *)url
           bodyParameter:(NSDictionary *)dict
                 success:(void (^)(id json))success
                    fail:(void (^)())fail
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager] ;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:ACCEPTABLE_CONTENT_TYPES,nil];//设置相应内容类型
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    [manager POST:url
       parameters:dict
          success:^(NSURLSessionDataTask *task, id responseObject) {
              NSString *jsonStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
              NSData *dataBody = [jsonStr dataUsingEncoding:NSUTF8StringEncoding] ;
              NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData:dataBody options:NSJSONReadingMutableContainers error:nil] ;
              NSLog(@"success %@", jsonData);
              if (success) success(jsonData);
          } failure:^(NSURLSessionDataTask *task, NSError *error) {
              NSLog(@"fail %@", error);
              if (fail) fail();
          }] ;
}



+ (ResultParsered *)getJsonWithURLstr:(NSString *)urlstr
         AndWithParamer:(NSDictionary *)dict
            AndWithMode:(METHOD_REQUEST)mode
{
    
    if (mode == GET_MODE) {
        
        NSString *apStr = [self getUrlInGetModeWithDic:dict] ;
        urlstr = [urlstr stringByAppendingString:apStr] ;
        
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlstr]];
        request.timeOutSeconds = TIMEOUT ;
        [request startSynchronous];
        NSError *error = [request error];
        NSString *response;
        if ( error )
        {
            NSLog(@"error:%@",error);
            return nil ;
        }
        
        response = [request responseString] ;
        
//        NSLog(@"urlstr : %@\n%@",urlstr,response)  ;
        NSLog(@"urlstr : %@\n",urlstr)  ;
        NSLog(@"response : %@\n",response)  ;

        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:[response dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil] ;
        
        ResultParsered *result = [[ResultParsered alloc] initWithDic:dictionary] ;
        return result ;
    }
    else if (mode == POST_MODE) {

        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlstr]];
        request.timeOutSeconds = TIMEOUT ;
        
        NSArray *allKeys = [dict allKeys] ;
        for (NSString *key in allKeys)
        {
            NSString *val = [dict objectForKey:key] ;
            [request setPostValue:val forKey:key] ;
        }
        
        [request startSynchronous]                  ;
        
        NSError *error = [request error]            ;
        NSString *response                          ;
        
        if ( error )
        {
            NSLog(@"error:%@",error);
            return nil ;
        }
        response = [request responseString]         ;
        
//        NSLog(@"urlstr : %@\n%@",urlstr,response)   ;
        NSLog(@"urlstr : %@\n",urlstr)  ;
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:[response dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil] ;
        
        ResultParsered *result = [[ResultParsered alloc] initWithDic:dictionary] ;
        
        return result ;
    }
    
    
    return nil ;
}


+ (NSString *)getUrlInGetModeWithDic:(NSDictionary *)dict
{
    NSArray *allKeys = [dict allKeys] ;
    BOOL bFirst = YES ;
    NSString *appendingStr = @"" ;
    for (NSString *key in allKeys)
    {
        NSString *val = [dict objectForKey:key] ;
        NSString *item = @"";
        if (bFirst) {
            bFirst = NO ;
            item = [NSString stringWithFormat:@"?&%@=%@",key,val] ; //因特殊需求而改动
        }
        else
        {
            item = [NSString stringWithFormat:@"&%@=%@",key,val] ;
        }
        
        appendingStr = [appendingStr stringByAppendingString:item] ;
    }
    
    return appendingStr ;
}



@end
