//
//  OrderListProductCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/7.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "OrderListProductCell.h"

@interface OrderListProductCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgProduct;
@property (weak, nonatomic) IBOutlet UILabel *lbProductName;
@property (weak, nonatomic) IBOutlet UILabel *lbPrice;
@property (weak, nonatomic) IBOutlet UILabel *lbDesc;//规格
@property (weak, nonatomic) IBOutlet UILabel *lbNumber;//x1

@end

@implementation OrderListProductCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _imgProduct.layer.borderColor = [UIColor xt_seperate].CGColor ;
    _imgProduct.layer.borderWidth = 1. ;
    _lbProductName.textColor = [UIColor xt_w_dark] ;
    _lbPrice.textColor = [UIColor xt_w_dark] ;
    _lbDesc.textColor = [UIColor xt_w_light] ;
    _lbNumber.textColor = [UIColor xt_w_light] ;
    
    UIView *baseLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGHeight(self.frame), APP_WIDTH, 1)] ;
    baseLine.backgroundColor = [UIColor xt_seperate] ;
    [self addSubview:baseLine] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
