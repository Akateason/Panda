//
//  OrderlListCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/7.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "OrderlListCell.h"
#import "OrderListProductCell.h"

@interface OrderlListCell () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *head;
@property (weak, nonatomic) IBOutlet UILabel *lbOrderNumberID;
@property (weak, nonatomic) IBOutlet UILabel *lbOrderStatus;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIView *viewSum;
@property (weak, nonatomic) IBOutlet UILabel *lbHowmanyProducts;
@property (weak, nonatomic) IBOutlet UILabel *lbSum;
@property (weak, nonatomic) IBOutlet UIView *viewButtons;
@property (weak, nonatomic) IBOutlet UIButton *bt1; //最右button
@property (weak, nonatomic) IBOutlet UIButton *bt2;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightForTable;

@end

@implementation OrderlListCell

+ (CGFloat)getHeight
{
    return 131. + 2 * 90. + 10. ;
}

#pragma mark - life
- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    // configure UIs
    [self configureUIs] ;
    // configure table
    [self configureTable] ;
    // table height
    _heightForTable.constant = 2 * 90. ;
}

- (void)configureUIs
{
    self.backgroundColor = [UIColor xt_seperate] ;
    
    _head.backgroundColor = [UIColor whiteColor] ;
    _lbOrderNumberID.textColor = [UIColor xt_w_dark] ;
    _lbOrderStatus.textColor = [UIColor xt_w_dark] ;
    UIView *headBaseLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGHeight(_head.frame) - 1, APP_WIDTH, 1)] ;
    headBaseLine.backgroundColor = [UIColor xt_seperate] ;
    [_head addSubview:headBaseLine] ;
//
    _viewSum.backgroundColor = [UIColor whiteColor] ;
    _lbHowmanyProducts.textColor = [UIColor xt_w_dark] ;
    _lbSum.textColor = [UIColor xt_w_dark] ;
    UIView *sViewHeadLine = [[UIView alloc] initWithFrame:CGRectMake(0, 1, APP_WIDTH, 1)] ;
    sViewHeadLine.backgroundColor = [UIColor xt_seperate] ;
    [_viewSum addSubview:sViewHeadLine] ;
    UIView *sViewBaseLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGHeight(_viewSum.frame) - 1, APP_WIDTH, 1)] ;
    sViewBaseLine.backgroundColor = [UIColor xt_seperate] ;
    [_viewSum addSubview:sViewBaseLine] ;
//
    _viewButtons.backgroundColor = [UIColor whiteColor] ;
    _bt1.backgroundColor = [UIColor whiteColor] ;
    _bt2.backgroundColor = [UIColor whiteColor] ;
    [_bt1 setTitleColor:[UIColor xt_w_light] forState:0] ;
    [_bt2 setTitleColor:[UIColor xt_w_light] forState:0] ;
    _bt1.layer.borderColor = [UIColor xt_w_light].CGColor ;
    _bt2.layer.borderColor = [UIColor xt_w_light].CGColor ;
    _bt1.layer.borderWidth = 1. ;
    _bt2.layer.borderWidth = 1. ;
    _bt1.layer.cornerRadius = 5. ;
    _bt2.layer.cornerRadius = 5. ;
    
}

- (void)configureTable
{
    [_table registerNib:[UINib nibWithNibName:kID_OrderListProductCell bundle:nil] forCellReuseIdentifier:kID_OrderListProductCell] ;
    _table.separatorStyle = 0 ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.scrollEnabled = false ;
}





#pragma mark - tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderListProductCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_OrderListProductCell] ;
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90. ;
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
