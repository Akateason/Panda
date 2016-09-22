//
//  MineController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MineController.h"
#import "UserOnDevice.h"
#import "MineUserInfoCell.h"

@interface MineController () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet RootTableView *table;

@end

@implementation MineController

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
    _table.separatorStyle = 0 ;
    [_table registerNib:[UINib nibWithNibName:kID_MineUserInfoCell bundle:nil] forCellReuseIdentifier:kID_MineUserInfoCell] ;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO] ;
    [self.navigationController setNavigationBarHidden:NO] ;
    
//    [UserOnDevice  clean] ;
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
//    return 5 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    if (section == 0) {
        MineUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MineUserInfoCell] ;
        return cell ;
    }
    else if (section == 1) {
        
    }
    else if (section == 2) {
        
    }
    else if (section == 3) {
        
    }
    else if (section == 4) {
        
    }
    return nil ;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    if (section == 0) {
        return 143. ;
    }
    else if (section == 1) {
        
    }
    else if (section == 2) {
        
    }
    else if (section == 3) {
        
    }
    else if (section == 4) {
        
    }
    return 0. ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0 ;
}





@end
