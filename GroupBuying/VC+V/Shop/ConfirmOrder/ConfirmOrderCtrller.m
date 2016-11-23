//
//  ConfirmOrderCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/11/23.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ConfirmOrderCtrller.h"
#import "ODVCAddressCell.h"
#import "ODVCProductListCell.h"
#import "COVCPostCostCell.h"
#import "COVCPaywayCell.h"

@interface ConfirmOrderCtrller () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table ;

@property (weak, nonatomic) IBOutlet UIView *bottomBar;
@property (weak, nonatomic) IBOutlet UILabel *lbSumKey;
@property (weak, nonatomic) IBOutlet UILabel *lbAllPrice;
@property (weak, nonatomic) IBOutlet UILabel *lbNumOfProduct;

@property (weak, nonatomic) IBOutlet UIButton *btPayNow;

@end

@implementation ConfirmOrderCtrller

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"确认订单" ;
    
    _bottomBar.backgroundColor = [UIColor whiteColor] ;
    _lbSumKey.textColor = [UIColor xt_w_dark] ;
    _lbAllPrice.textColor = [UIColor xt_w_dark] ;
    _lbNumOfProduct.textColor = [UIColor xt_w_dark] ;
    _btPayNow.backgroundColor = [UIColor xt_tabbarRedColor] ;
    
    
    [_table registerNib:[UINib nibWithNibName:kID_ODVCAddressCell bundle:nil] forCellReuseIdentifier:kID_ODVCAddressCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_ODVCProductListCell bundle:nil] forCellReuseIdentifier:kID_ODVCProductListCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_COVCPostCostCell bundle:nil] forCellReuseIdentifier:kID_COVCPostCostCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_COVCPaywayCell bundle:nil] forCellReuseIdentifier:kID_COVCPaywayCell] ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.separatorStyle = 0 ;
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4 ;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section = (int)indexPath.section ;
    if (section == 0)
    { // 地址
        ODVCAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_ODVCAddressCell] ;
        return cell ;
    }
    else if (section == 1)
    { // 商品
        ODVCProductListCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_ODVCProductListCell] ;
        return cell ;
    }
    else if (section == 2)
    { // 运费快递
        COVCPostCostCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_COVCPostCostCell] ;
        return cell ;
    }
    else if (section == 3)
    { // 支付
        COVCPaywayCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_COVCPaywayCell] ;
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
    else if (section == 1) { // 商品
        return [ODVCProductListCell getHeight] ;
    }
    else if (section == 2)
    { // 运费快递
        return kHeight_COVCPostCostCell ;
    }
    else if (section == 3)
    { // 支付
        return kHeight_payway ;
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
