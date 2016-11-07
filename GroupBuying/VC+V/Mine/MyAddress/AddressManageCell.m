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
@property (weak, nonatomic) IBOutlet UIView *baseBar;

@end

@implementation AddressManageCell

#pragma mark - height . with address length .
+ (CGFloat)getHeight
{
    return 123. ; //
}

#pragma mark - actions
- (IBAction)btDefaultAddressOnClick:(UIButton *)sender
{
    NSLog(@"default address") ;
    sender.selected = !sender.selected ;
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
    self.backgroundColor = [UIColor whiteColor] ;
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
    //
    _baseBar.backgroundColor = [UIColor xt_seperate] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
