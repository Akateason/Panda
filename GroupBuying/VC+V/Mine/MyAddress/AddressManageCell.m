//
//  AddressManageCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/7.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "AddressManageCell.h"

@interface AddressManageCell ()
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbPhone;
@property (weak, nonatomic) IBOutlet UILabel *lbAddressDetail;
@property (weak, nonatomic) IBOutlet UIView *viewTool;
@property (weak, nonatomic) IBOutlet UIButton *btDefaultAddress;
@property (weak, nonatomic) IBOutlet UIButton *btEdit;
@property (weak, nonatomic) IBOutlet UIButton *btDelete;

@end

@implementation AddressManageCell

+ (CGFloat)getHeight
{
    return 121. ;
}

#pragma mark - actions
- (IBAction)btDefaultAddressOnClick:(id)sender
{
    NSLog(@"default address") ;
}

- (IBAction)btEditOnClick:(id)sender
{
    NSLog(@"edit") ;
}

- (IBAction)btDeleteOnClick:(id)sender
{
    NSLog(@"del") ;
}

#pragma mark - life
- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _lbName.textColor = [UIColor xt_w_dark] ;
    _lbPhone.textColor = [UIColor xt_w_dark] ;
    _lbAddressDetail.textColor = [UIColor xt_w_dark] ;
    _viewTool.backgroundColor = [UIColor whiteColor] ;
    [_btEdit setTitleColor:[UIColor xt_w_desc] forState:0] ;
    [_btDelete setTitleColor:[UIColor xt_w_desc] forState:0] ;
    [_btEdit setTitleColor:[UIColor xt_w_desc] forState:0] ;
    UIView *sepline = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, 1)] ;
    sepline.backgroundColor = [UIColor xt_seperate] ;
    [_viewTool addSubview:sepline] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
