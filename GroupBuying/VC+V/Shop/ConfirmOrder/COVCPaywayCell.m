//
//  COVCPaywayCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/23.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "COVCPaywayCell.h"
#import "PaywayItemCell.h"

@interface COVCPaywayCell () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lbPayway;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIView *bottomBar;

@end

@implementation COVCPaywayCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _lbPayway.textColor = [UIColor xt_w_light] ;
    _bottomBar.backgroundColor = [UIColor xt_seperate] ;
    _table.backgroundColor = [UIColor whiteColor] ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.scrollEnabled = false ;
    _table.separatorStyle = 0 ;
    [_table registerNib:[UINib nibWithNibName:kID_PaywayItemCell bundle:nil] forCellReuseIdentifier:kID_PaywayItemCell] ;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    int row = (int)indexPath.row ;
    PaywayItemCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_PaywayItemCell] ;
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.0 ;
}







- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
