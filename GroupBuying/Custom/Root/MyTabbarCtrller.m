//
//  MyTabbarCtrller.m
//  SuBaoJiang
//
//  Created by apple on 15/6/5.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#import "MyTabbarCtrller.h"
#import "AppDelegate.h"
#import "MineNavCtrller.h"
#import "UserOnDevice.h"

@interface MyTabbarCtrller () <UITabBarControllerDelegate>

@end

@implementation MyTabbarCtrller

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        // Set in AppDelegate
        self.tabBar.tintColor = [UIColor xt_tabbarRedColor] ;
        self.delegate = self ;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    NSArray *vclist = self.viewControllers ;
    for (int i = 0; i < vclist.count; i++)
    {
        UITabBarItem *item = self.tabBar.items[i] ;
        item.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"item%d_s",i+1]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
        item.image = [[UIImage imageNamed:[NSString stringWithFormat:@"item%d",i+1]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}


#pragma mark --
#pragma mark - tabbar controller delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([viewController isMemberOfClass:[MineNavCtrller class]])
    {
        if ([UserOnDevice hasLogin]) {
            return YES ;
        }
        else {
            [UserOnDevice checkForLoginOrNot:self.selectedViewController] ;
            return NO ;
        }
    }
    
    return YES;
}


@end
