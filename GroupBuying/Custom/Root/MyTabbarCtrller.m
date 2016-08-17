//
//  MyTabbarCtrller.m
//  SuBaoJiang
//
//  Created by apple on 15/6/5.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#import "MyTabbarCtrller.h"
#import "AppDelegate.h"

@interface MyTabbarCtrller ()

@end

@implementation MyTabbarCtrller

//  static int indexCache = 0 ;

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        // Set in AppDelegate
//        ((AppDelegate *)[UIApplication sharedApplication].delegate).tabbarCtrller = self ;
        self.tabBar.tintColor = [UIColor xt_tabbarRedColor] ;
//        self.delegate = self ;
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent] ;
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

/*
#pragma mark --
#pragma mark - tabbar controller delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([viewController isMemberOfClass:[NavCameraCtrller class]])
    {
//        NSLog(@"camera clicked !") ;
        [NavCameraCtrller jump2NavCameraCtrllerWithOriginCtrller:self.selectedViewController] ;
        
        return NO ;
    }
    
    if ([tabBarController.selectedViewController isEqual:viewController])
    {
        //double tap item in index page .
        if ([viewController isMemberOfClass:[NavIndexCtrller class]])
        {
            indexCache ++ ;
            
            [self performSelectorInBackground:@selector(deleteCacheIndex)
                                   withObject:nil] ;
            
            if (indexCache % 2 == 0)
            {
                [self.homePageDelegate doubleTapedHomePage] ;
            }
        }
        else
        {
            indexCache = 0 ;
        }
        
        return NO;
    }
    
    return YES;
}

- (void)deleteCacheIndex
{
    sleep(1) ;
    indexCache = 0 ;
}
*/

@end
