//
//  ShopCartCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/10/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ShopCartCtrller.h"
#import "UIAlternativeButton.h"
#import "CartCell.h"
#import "CartIntroductionFooterView.h"

@interface ShopCartCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet UIAlternativeButton *bt_AllChoose;
@property (weak, nonatomic) IBOutlet UIView *bottomBar;
@property (weak, nonatomic) IBOutlet UIButton *btComplete;
@property (weak, nonatomic) IBOutlet UILabel *lb_allPrice;
@property (weak, nonatomic) IBOutlet UILabel *lb_noFreight;

@property (weak, nonatomic) IBOutlet RootTableView *table;

@end

@implementation ShopCartCtrller

#pragma mark - action
- (IBAction)btAllChooseOnClick:(UIAlternativeButton *)sender
{
    sender.selected = !sender.selected ;
    NSLog(@"全选 : %d",sender.selected) ;
    
}

- (IBAction)btCompleteOnClick:(id)sender
{
    NSLog(@"结算") ;
}

#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"购物车" ;
    [self configureUIs] ;
}

- (void)configureUIs
{
    _bottomBar.backgroundColor = [UIColor whiteColor] ;
    [_bt_AllChoose setTitleColor:[UIColor xt_w_light] forState:0] ;
    _bottomBar.backgroundColor = [UIColor whiteColor] ;
    _btComplete.backgroundColor = [UIColor xt_tabbarRedColor] ;
    _lb_allPrice.textColor = [UIColor xt_w_dark] ;
    _lb_noFreight.textColor = [UIColor xt_w_light] ;
    
    //
    _table.backgroundColor = [UIColor xt_seperate] ;
    _table.separatorStyle = 0 ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
    [_table registerNib:[UINib nibWithNibName:kID_CartCell bundle:nil] forCellReuseIdentifier:kID_CartCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_CartIntroductionFooterView bundle:nil] forHeaderFooterViewReuseIdentifier:kID_CartIntroductionFooterView] ;
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
    return 2 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_CartCell] ;
    
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kHeight_CartCell;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CartIntroductionFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kID_CartIntroductionFooterView] ;
    
    return footer ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30. ;
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
