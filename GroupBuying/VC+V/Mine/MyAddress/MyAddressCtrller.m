//
//  MyAddressCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/11/7.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyAddressCtrller.h"
#import "AddressManageCell.h"

@interface MyAddressCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btAdd;
@property (weak, nonatomic) IBOutlet RootTableView *table;
@end

@implementation MyAddressCtrller

#pragma - action
- (IBAction)btAddAddressOnclick:(id)sender
{
    NSLog(@"add address") ;
    
}

#pragma - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor xt_seperate] ;
    
    [_table registerNib:[UINib nibWithNibName:kID_AddressManageCell bundle:nil] forCellReuseIdentifier:kID_AddressManageCell] ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    _table.delegate = self ;
    _table.dataSource = self ;
    _table.xt_Delegate = self ;
}

#pragma - RootTableViewDelegate
- (void)loadNewData
{
    
}

- (void)loadMoreData
{
    
}

#pragma - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddressManageCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_AddressManageCell] ;
    return cell ;
}

#pragma - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [AddressManageCell getHeight] ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
