//
//  HotProductCtrller.m
//  GroupBuying
//
//  Created by teason on 16/9/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HotProductListCtrller.h"
#import "HotProductListCell.h"
#import "HotProductItemCtrller.h"

@interface HotProductListCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet RootTableView *table;

@end

@implementation HotProductListCtrller

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
    _table.separatorStyle = 0 ;
    [_table registerNib:[UINib nibWithNibName:kID_HotProductListCell bundle:nil] forCellReuseIdentifier:kID_HotProductListCell] ;
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
    HotProductListCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_HotProductListCell] ;
    cell.index = indexPath.row + 1 ;
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return Height_HotProductCell ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HotProductItemCtrller *hotPItemCtrller = (HotProductItemCtrller *)[[HotProductItemCtrller class] getCtrllerFromStory:@"Find" controllerIdentifier:@"HotProductItemCtrller"] ;
    [self.navigationController pushViewController:hotPItemCtrller animated:YES] ;
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
