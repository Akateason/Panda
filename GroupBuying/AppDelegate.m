//
//  AppDelegate.m
//  GroupBuying
//
//  Created by TuTu on 15/12/23.
//  Copyright © 2015年 teason. All rights reserved.
//

#import "AppDelegate.h"
#import "UMSocial.h"
#import "AppDelegateInitial.h"
#import "ServerRequest.h"
#import "WeiboSDK.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    AppDelegateInitial *appInitial = [[AppDelegateInitial alloc] initWithApplication:application
                                                                             options:launchOptions
                                                                              window:_window] ;
    [appInitial setup] ;

    return YES;
}

/*
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [UMSocialSnsService handleOpenURL:url] ;
    if (result == FALSE) {
        //调用其他SDK，例如新浪微博SDK等
        if ([url.absoluteString hasPrefix:@"wb"]) {
            return [WeiboSDK handleOpenURL:url delegate:self] ;
        }
        else if ([url.absoluteString hasPrefix:@"Su"]) {
//            return [WemartSDK handleAppCallback:url] ;
        }
    }
    
    return result ;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如新浪微博SDK等
        if ([url.absoluteString hasPrefix:@"wb"]) {
            return [WeiboSDK handleOpenURL:url delegate:self] ;
        }
        else if ([url.absoluteString hasPrefix:@"Su"]) {
//            return [WemartSDK handleAppCallback:url] ;
        }
    }
    
    return result ;
}


#pragma mark --
#pragma mark - Weibo

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
        WBSendMessageToWeiboResponse* sendMessageToWeiboResponse = (WBSendMessageToWeiboResponse*)response ;
        NSString* accessToken = [sendMessageToWeiboResponse.authResponse accessToken];
        if (accessToken) {
            self.wbtoken = accessToken;
        }
        NSString* userID = [sendMessageToWeiboResponse.authResponse userID];
        if (userID) {
            self.wbCurrentUserID = userID;
        }

    }
    else if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        self.wbtoken = [(WBAuthorizeResponse *)response accessToken];
        self.wbCurrentUserID = [(WBAuthorizeResponse *)response userID];
        self.wbRefreshToken = [(WBAuthorizeResponse *)response refreshToken];
    }
}
*/


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
