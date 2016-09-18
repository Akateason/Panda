//
//  AppDelegateInitial.m
//  GroupBuying
//
//  Created by TuTu on 15/12/24.
//  Copyright © 2015年 teason. All rights reserved.
//

#import "AppDelegateInitial.h"
#import "KeyChainHeader.h"
//#import "UMSocial.h"
//#import "UMSocialWechatHandler.h"
#import "WeiboSDK.h"
//#import "UMSocialSinaSSOHandler.h"
#import "DigitInformation.h"
//#import "WXApi.h"
#import <PhotoEditFramework/PhotoEditFramework.h>



NSString *const UM_APPKEY       = @"565681dc67e58e4d0e00014d" ;
NSString *const WX_APPKEY       = @"wxd521387c0b66efaa" ;
NSString *const WX_APPSECRET    = @"d4624c36b6795d1d99dcf0547af5443d" ;

NSString *const WB_APPKEY       = @"1634965927" ;
NSString *const WB_APPSECRET    = @"360a37c962a65ee96b8b5189708c986e" ;
NSString *const WB_REDIRECTURL  = @"http://sns.whalecloud.com/sina2/callback" ;

NSString *const APPSTORE_APPID  = @"999705868" ;

@interface AppDelegateInitial ()

@property (nonatomic,strong) NSDictionary *launchOptions ;
@property (nonatomic,strong) UIApplication *application ;
@property (nonatomic,strong) UIWindow *window ;

@end

@implementation AppDelegateInitial

- (instancetype)initWithApplication:(UIApplication *)application
                            options:(NSDictionary *)launchOptions
                             window:(UIWindow *)window
{
    self = [super init];
    if (self)
    {
        self.application = application ;
        self.launchOptions = launchOptions ;
        self.window = window ;
    }
    return self;
}

- (void)setup
{
    //  Setting My Style
    [self setMyStyleWithWindow:self.window] ;
    //  Get Token and userInfo if loginED (token existed)
//    [self getTokenAndUser] ;
    //  Umeng SDK Initialization .
//    [self UmengSdkInitialization] ;
    //  weibo Initialization .
//    [self weiboInitialization] ;
    
    
    
    if (![pg_edit_sdk_controller sStart:kCamera360AppKey]) {
        //  http://sdk.camera360.com
        NSAssert(NO, @"Invalid key");
    }

}

- (void)getTokenAndUser
{
//    if ([[DigitInformation shareInstance] g_token] != nil)
//    {
//        [[DigitInformation shareInstance] g_user] ;
//    }
}

- (void)setMyStyleWithWindow:(UIWindow *)window
{
    //1 status bar .
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent] ;
    [[UIApplication sharedApplication] keyWindow].tintColor = [UIColor xt_mainColor] ;
    
    //2 nav style .
    [[UINavigationBar appearance] setBarTintColor:[UIColor xt_mainColor]] ;
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}] ;
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]] ;
    [[UINavigationBar appearance] setBackgroundColor:[UIColor xt_mainColor]] ;
}

// Umeng SDK SHARE
- (void)UmengSdkInitialization
{
//    [UMSocialData setAppKey:UM_APPKEY] ;
    
    //设置微信AppId、appSecret，分享url
//    [UMSocialWechatHandler setWXAppId:WX_APPKEY
//                            appSecret:WX_APPSECRET
//                                  url:nil] ;
    
    //由于苹果审核政策需求，建议大家对未安装客户端平台进行隐藏，在设置QQ、微信AppID之后调用下面的方法，
//    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite]] ;
}

- (void)weiboInitialization
{
    //[WeiboSDK enableDebugMode:YES] ;
//    [WeiboSDK registerApp:WB_APPKEY] ;
}

@end
