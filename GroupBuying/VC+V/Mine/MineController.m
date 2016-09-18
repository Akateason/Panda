//
//  MineController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MineController.h"
#import "UserOnDevice.h"

@implementation MineController

- (void)viewDidLoad
{
    [super viewDidLoad] ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO] ;
    [self.navigationController setNavigationBarHidden:NO] ;
    
    
    
    [UserOnDevice  clean] ;
}




@end
