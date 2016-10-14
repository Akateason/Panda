//
//  RootCtrl.h
//  Teason
//
//  Created by ; on 14-8-21.
//  Copyright (c) 2014年 TEASON. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DigitInformation ;
@class XTAnimation ;
#import "ServerRequest.h"
#import "RootTableView.h"
#import "YYModel.h"
#import "SVProgressHUD.h"



@interface RootCtrl : UIViewController

// get ctrller from storyboard
+ (RootCtrl *)getCtrllerFromStory:(NSString *)storyboard
             controllerIdentifier:(NSString *)identifier ;

#pragma mark - title for Umeng Anaylize .
@property (nonatomic,copy)   NSString      *myTitle ;

#pragma mark - xtNetReloader
- (void)showNetReloaderWithReloadButtonClickBlock:(void(^)())reloadBlock ;
- (void)dismissNetReloader ;

#pragma mark - show guiding Image list . teach users how to use app .
@property (nonatomic,strong) NSArray       *guidingStrList ;
@property (nonatomic)        int           guidingIndex ;

#pragma mark - Set No Back BarButton
/*
 *  Default is NO
 *  IF YES , delete all bar buttons
 */
@property (nonatomic)        BOOL          isDelBarButton ;

#pragma mark - hide tab bar
- (void)makeTabBarHidden:(BOOL)hide ;
- (void)makeTabBarHidden:(BOOL)hide animated:(BOOL)animated ;

#pragma mark - click back button in NavgationBar
// default is NO, YES when you have to rewrite @SEL - iClickedBackButton in ctrller .
@property (nonatomic)        BOOL          bOpenClickBackButtonCallBack ;
- (void)iClickedBackButton ; // rewrite this func if necessary .

@end
