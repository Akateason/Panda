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
#import "FVCBannerCell.h"

@interface FindController () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *topBar;
@property (weak, nonatomic) IBOutlet UIControl *searchTouchZoom;
@property (weak, nonatomic) IBOutlet UILabel *labelSearchbarText;
@property (weak, nonatomic) IBOutlet RootTableView *table;

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
    
    
    _table.separatorStyle = 0 ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
    
    [_table registerNib:[UINib nibWithNibName:kID_FVCBannerCell bundle:nil] forCellReuseIdentifier:kID_FVCBannerCell] ;
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



#pragma mark - RootTableViewDelegate
- (void)loadNewData
{

    
}

- (void)loadMoreData
{
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FVCBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_FVCBannerCell] ;
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [FVCBannerCell getHeight] ;
}



@end
