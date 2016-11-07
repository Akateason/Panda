//
//  MyActivityCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/11/7.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyActivityCtrller.h"
#import "MyActivityCell.h"

@interface MyActivityCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>
@property (weak, nonatomic) IBOutlet RootTableView *table;
@end

@implementation MyActivityCtrller

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的活动" ;
    [_table registerNib:[UINib nibWithNibName:kID_MyActivityCell bundle:nil] forCellReuseIdentifier:kID_MyActivityCell] ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    _table.separatorStyle = 0 ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
    
}


#pragma mark - roottabledelegate
- (void)loadNewData
{
    
}

- (void)loadMoreData
{
    
}

#pragma mark - tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MyActivityCell] ;
    cell.index = (int)indexPath.row ;
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [MyActivityCell getHeight] ;
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
