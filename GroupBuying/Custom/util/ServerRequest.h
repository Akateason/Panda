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

+ (void)loginWithUserName:(NSString *)name
                 password:(NSString *)password
                  success:(void (^)(id json))success
                     fail:(void (^)())fail ;


+ (void)registerWithUserName:(NSString *)name
                    password:(NSString *)password
                     success:(void (^)(id json))success
                        fail:(void (^)())fail ;

@end





