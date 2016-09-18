//
//  FindController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FindController.h"
#import "CuttingViewController.h"
#import "UserOnDevice.h"

@interface FindController ()

@end

@implementation FindController



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
