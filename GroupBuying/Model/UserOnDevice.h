//
//  UserOnDevice.h
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//  机器上的用户 .


#import "User.h"

@interface UserOnDevice : User

+ (void)cacheUserCurrent:(User *)user ;

+ (User *)currentUserOnDevice ;

+ (void)cacheUserName:(NSString *)name
             password:(NSString *)password ;

+ (void)cacheToken:(NSString *)token ;

+ (NSString *)token ;

+ (void)checkForLoginOrNot:(UIViewController *)ctrller ;  // if not login . present from ctrller .

+ (void)clean ; // delete name , pass, token .


@end
