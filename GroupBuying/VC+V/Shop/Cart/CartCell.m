//
//  CartCell.m
//  GroupBuying
//
//  Created by TuTu on 16/10/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "CartCell.h"

@interface CartCell ()

@property (weak, nonatomic) IBOutlet UIView *v1;
@property (weak, nonatomic) IBOutlet UIView *v2;
@property (weak, nonatomic) IBOutlet UIView *v3;
@property (weak, nonatomic) IBOutlet UIView *v1_line;
@property (weak, nonatomic) IBOutlet UIButton *btChoose;
@property (weak, nonatomic) IBOutlet UIImageView *imgProduct;
@property (weak, nonatomic) IBOutlet UILabel *lb_productName;
@property (weak, nonatomic) IBOutlet UILabel *lb_price;
@property (weak, nonatomic) IBOutlet UILabel *lb_specification; // 规格
@property (weak, nonatomic) IBOutlet UIButton *btDelete;

@property (weak, nonatomic) IBOutlet UIView *v2_line;
@property (weak, nonatomic) IBOutlet UILabel *lb_tax; // 进口税
@property (weak, nonatomic) IBOutlet UILabel *lb_taxVal;

@property (weak, nonatomic) IBOutlet UILabel *lb_sum; // 小计
@property (weak, nonatomic) IBOutlet UILabel *lb_sumVal;

// + -
@property (weak, nonatomic) IBOutlet UIButton *btNumPlus;
@property (weak, nonatomic) IBOutlet UIButton *btNumMinus;
@property (weak, nonatomic) IBOutlet UILabel *lb_Num;

//
@property (weak, nonatomic) IBOutlet UILabel *lb_offSale; //显示 已下架

@end

@implementation CartCell

- (IBAction)btChooseOnClick:(UIButton *)sender
{
    NSLog(@"选中") ;
    sender.selected = !sender.selected ;
}

- (IBAction)btDeleteOnClick:(UIButton *)sender
{
    NSLog(@"del") ;
}

- (IBAction)btNumPlusOnClick:(UIButton *)sender
{
    NSLog(@"+") ;
}

- (IBAction)btNumMinusOnClick:(id)sender
{
    NSLog(@"-") ;
}

- (void)tapProduct
{
    NSLog(@"tap product") ;
    if (self.pdtDelegate && [self.pdtDelegate respondsToSelector:@selector(productOnClick)])
    {
        [self.pdtDelegate productOnClick] ;
    }
}





- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _v1.backgroundColor = [UIColor whiteColor] ;
    _v2.backgroundColor = [UIColor whiteColor] ;
    _v3.backgroundColor = [UIColor whiteColor] ;
    _v1_line.backgroundColor = [UIColor xt_seperate] ;
    _v2_line.backgroundColor = [UIColor xt_seperate] ;
    
    _imgProduct.layer.borderColor = [UIColor xt_seperate].CGColor ;
    _lb_productName.textColor = [UIColor xt_w_dark] ;
    _lb_price.textColor = [UIColor xt_w_dark] ;
    _lb_specification.textColor = [UIColor xt_w_light] ;
    _lb_tax.textColor = [UIColor xt_w_light] ;
    _lb_taxVal.textColor = [UIColor xt_w_dark] ;
    _lb_sum.textColor = [UIColor xt_w_light] ;
    _lb_sumVal.textColor = [UIColor xt_tabbarRedColor] ;
    
    self.backgroundColor = [UIColor xt_seperate] ;
    
    _lb_Num.backgroundColor = [UIColor whiteColor] ;
    _lb_Num.layer.borderColor = [UIColor xt_w_desc].CGColor ;
    _lb_Num.layer.borderWidth = 0.5f ;
    _lb_Num.textColor = [UIColor xt_w_dark] ;
    
    _lb_offSale.textColor = [UIColor whiteColor] ;
    _lb_offSale.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.7] ;
    
    
    _imgProduct.userInteractionEnabled = true ;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapProduct)] ;
    [_imgProduct addGestureRecognizer:tapGesture] ;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
