//
//  ActivityController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ActivityController.h"
#import "ActivityPageCell.h"

@interface ActivityController () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>
@property (weak, nonatomic) IBOutlet RootTableView *table;

@end

@implementation ActivityController


#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    _table.separatorStyle = 0 ;
    _table.dataSource = self ;
    _table.delegate  =self ;
    _table.xt_Delegate = self ;
    [_table registerNib:[UINib nibWithNibName:kID_ActivityPageCell bundle:nil] forCellReuseIdentifier:kID_ActivityPageCell] ;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO] ;
    [self.navigationController setNavigationBarHidden:NO] ;
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
    return 3 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityPageCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_ActivityPageCell] ;
    cell.index = indexPath.row ;
    return cell ;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return Height_AcivityPageCell ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
