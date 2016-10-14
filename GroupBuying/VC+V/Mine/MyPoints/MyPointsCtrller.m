//
//  MyPointsCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/10/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyPointsCtrller.h"
#import "MyPointsInfomationCell.h"
#import "MyPointDetailHeader.h"
#import "PointsCell.h"

@interface MyPointsCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet RootTableView *table;

@end

@implementation MyPointsCtrller

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"我的积分" ;
    
    _table.separatorColor = [UIColor xt_seperate] ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    [_table registerNib:[UINib nibWithNibName:kID_MyPointsInfomationCell bundle:nil] forCellReuseIdentifier:kID_MyPointsInfomationCell] ;
    [_table registerClass:[MyPointDetailHeader class] forHeaderFooterViewReuseIdentifier:kID_MyPointDetailHeader] ;
    [_table registerNib:[UINib nibWithNibName:kID_PointsCell bundle:nil] forCellReuseIdentifier:kID_PointsCell] ;
}



#pragma mark - RootTableViewDelegate

- (void)loadNewData
{
    
}

- (void)loadMoreData
{
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1 ;
    }
    return 10 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MyPointsInfomationCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MyPointsInfomationCell] ;
        return cell ;
    }
    PointsCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_PointsCell] ;
    return cell ;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 168 ;
    }
    return 70 ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        MyPointDetailHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kID_MyPointDetailHeader] ;
        return header ;
    }
    return nil ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return kHeight_MyPointDetailHeader ;
    }
    return 0. ;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
