//
//  UserOnDevice.m
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UserOnDevice.h"
#import "RootCtrl.h"
#import "XTJson.h"
#import "YYModel.h"

static NSString * const kName       = @"name" ;
static NSString * const kPassword   = @"password" ;
static NSString * const kToken      = @"token" ;
static NSString * const kUser       = @"userCurrent" ;

@implementation UserOnDevice

+ (void)cacheUserCurrent:(User *)user
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    NSString *jsonStr = [user yy_modelToJSONString] ;
    [defaults setObject:jsonStr forKey:kUser] ;
}

+ (User *)currentUserOnDevice
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    NSString *json = [defaults objectForKey:kUser] ;
    User *auser = [User yy_modelWithJSON:[XTJson getJsonObj:json]] ;
    return auser ;
}

+ (void)cacheUserName:(NSString *)name
             password:(NSString *)password
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    [defaults setObject:name
                 forKey:kName] ;
    [defaults setObject:password
                 forKey:kPassword] ;
}

+ (void)cacheToken:(NSString *)token
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    [defaults setObject:token
                 forKey:kToken] ;

}

+ (NSString *)token
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    NSString *token = [defaults objectForKey:kToken] ;
    return token ;
}

// if not login . present from ctrller .
+ (void)checkForLoginOrNot:(UIViewController *)ctrller
{
    if ( ![self token].length )
    {
        NSLog(@"无登录") ;
        UINavigationController *navCtrller = (UINavigationController *)[[RootCtrl class] getCtrllerFromStory:@"Login" controllerIdentifier:@"LoginNavCtrller"] ;
        [ctrller presentViewController:navCtrller
                              animated:YES
                            completion:^{
            
        }] ;
    }
}


// delete name , pass, token .
+ (void)clean
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    [defaults removeObjectForKey:kName] ;
    [defaults removeObjectForKey:kPassword] ;
    [defaults removeObjectForKey:kToken] ;
    [defaults removeObjectForKey:kUser] ;
}


@end
