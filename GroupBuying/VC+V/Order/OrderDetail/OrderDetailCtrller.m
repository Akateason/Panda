//
//  OrderDetailCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/11/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "OrderDetailCtrller.h"
#import "ODVCAddressCell.h"
#import "ODVCOrderNumCell.h"
#import "ODVCProductListCell.h"

@interface OrderDetailCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>
@property (weak, nonatomic) IBOutlet RootTableView *table;
@end

@implementation OrderDetailCtrller

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"订单详情" ;
    
    _table.backgroundColor = [UIColor xt_seperate] ;
    [_table registerNib:[UINib nibWithNibName:kID_ODVCAddressCell bundle:nil] forCellReuseIdentifier:kID_ODVCAddressCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_ODVCOrderNumCell bundle:nil] forCellReuseIdentifier:kID_ODVCOrderNumCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_ODVCProductListCell bundle:nil] forCellReuseIdentifier:kID_ODVCProductListCell] ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
    _table.separatorStyle = 0 ;
    
}



#pragma mark - roottabledelegate
- (void)loadNewData
{
    
}

- (void)loadMoreData
{
    
}

#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section = (int)indexPath.section ;
    if (section == 0) { // 地址
        ODVCAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_ODVCAddressCell] ;
        return cell ;
    }
    else if (section == 1) { // 订单号
        ODVCOrderNumCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_ODVCOrderNumCell] ;
        return cell ;
    }
    else if (section == 2) { // 商品
        ODVCProductListCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_ODVCProductListCell] ;
        return cell ;
    }
    return nil ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section = (int)indexPath.section ;
    if (section == 0) { // 地址
        return [ODVCAddressCell getHeightWithAddressStr:@"中国 上海 杨新路 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"] ;
    }
    else if (section == 1) { // 订单号
        return kHeight_orderNumCell ;
    }
    else if (section == 2) { // 商品
        return [ODVCProductListCell getHeight] ;
    }
    
    return 0 ;
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
