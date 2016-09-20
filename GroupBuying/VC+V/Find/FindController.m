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

@property (weak, nonatomic) IBOutlet UIView *topBar;
@property (weak, nonatomic) IBOutlet UIControl *searchTouchZoom;
@property (weak, nonatomic) IBOutlet UILabel *labelSearchbarText;


@end

@implementation FindController

#pragma mark - action
- (IBAction)searchBarOnClick:(id)sender
{
    NSLog(@"searchbar click , push to search ctrl ") ;
}

#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    [self configureUIs] ;
}

- (void)configureUIs
{
    _labelSearchbarText.textColor = [UIColor xt_w_desc] ;
    _searchTouchZoom.backgroundColor = [UIColor xt_seperate] ;
    _topBar.backgroundColor = [UIColor whiteColor] ;
    _searchTouchZoom.layer.cornerRadius = 3. ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO] ;
    [self.navigationController setNavigationBarHidden:YES] ;
}







@end
