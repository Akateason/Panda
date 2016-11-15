//
//  ODVCProductListCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ODVCProductListCell.h"
#import "ODVCProductCell.h"

@interface ODVCProductListCell () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *topBar;
@property (weak, nonatomic) IBOutlet UILabel *lbHowmanyProducts;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIView *bottomBar;
@end

@implementation ODVCProductListCell

#pragma -
+ (CGFloat)getHeight
{
    return 249 ;
}


#pragma - life
- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    _topBar.backgroundColor = [UIColor whiteColor] ;
    _lbHowmanyProducts.textColor = [UIColor xt_w_dark] ;
    _bottomBar.backgroundColor = [UIColor xt_seperate] ;
    
    _table.scrollEnabled = false ;
    [_table registerNib:[UINib nibWithNibName:kID_ODVCProductCell bundle:nil] forCellReuseIdentifier:kID_ODVCProductCell] ;
    _table.backgroundColor = [UIColor whiteColor] ;
    _table.separatorStyle = 0 ;
    _table.dataSource = self ;
    _table.delegate = self ;
}


#pragma - UITableViewDataSource<NSObject>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  2 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ODVCProductCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_ODVCProductCell] ;
    return cell ;
}

#pragma - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [ODVCProductCell getHeight] ;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
