//
//  FindController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FindController.h"
#import "CuttingViewController.h"

@interface FindController ()

@end

@implementation FindController

- (IBAction)btAction:(id)sender
{
//    NSMutableArray *tmpList = [@[] mutableCopy] ;
//    for (int i = 1; i < 10; i++)
//    {
//        [tmpList addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%@",@(i)]]] ;
//    }
//    
//    CuttingViewController *cuttingCtrl = (CuttingViewController *)[[self class] getCtrllerFromStory:@"Camera" controllerIdentifier:@"CuttingViewController"] ;
//    cuttingCtrl.listPhotos = tmpList ;
//    [cuttingCtrl setHidesBottomBarWhenPushed:YES] ;
//    [self.navigationController pushViewController:cuttingCtrl animated:YES] ;
}

- (void)viewDidLoad
{
    [super viewDidLoad] ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO] ;
    [self.navigationController setNavigationBarHidden:NO] ;
}


@end
