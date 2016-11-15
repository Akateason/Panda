//
//  ODVCProductCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ODVCProductCell.h"

@interface ODVCProductCell ()
@property (weak, nonatomic) IBOutlet UIView *pdtBg;
@property (weak, nonatomic) IBOutlet UIView *tuijianCodeBg;
@property (weak, nonatomic) IBOutlet UIView *beizhuBg;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewProduct;
@property (weak, nonatomic) IBOutlet UILabel *lbProductName;
@property (weak, nonatomic) IBOutlet UILabel *lbPrice;
@property (weak, nonatomic) IBOutlet UILabel *lbGuige;
@property (weak, nonatomic) IBOutlet UILabel *lbHowmany;

@property (weak, nonatomic) IBOutlet UILabel *lb_t_recommendCode;
@property (weak, nonatomic) IBOutlet UILabel *lb_v_recommendCode;
@property (weak, nonatomic) IBOutlet UILabel *lb_t_remark;
@property (weak, nonatomic) IBOutlet UILabel *lb_v_remark;

@property (weak, nonatomic) IBOutlet UIView *baseBar;
@end

@implementation ODVCProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _pdtBg.backgroundColor = [UIColor whiteColor] ;
    _tuijianCodeBg.backgroundColor = [UIColor whiteColor] ;
    _beizhuBg.backgroundColor = [UIColor whiteColor] ;
    
    _imageViewProduct.layer.borderColor = [UIColor xt_seperate].CGColor ;
    _imageViewProduct.layer.borderWidth = 1. ;
    _lbProductName.textColor = [UIColor xt_w_dark] ;
    _lbPrice.textColor = [UIColor xt_w_dark] ;
    _lbGuige.textColor = [UIColor xt_w_light] ;
    _lbHowmany.textColor = [UIColor xt_w_light] ;
    
    _lb_t_recommendCode.textColor = [UIColor xt_w_light] ;
    _lb_t_remark.textColor = [UIColor xt_w_light] ;
    _lb_v_remark.textColor = [UIColor xt_w_dark] ;
    _lb_v_recommendCode.textColor = [UIColor xt_w_dark] ;
    
    _baseBar.backgroundColor = [UIColor xt_seperate] ;
}

+ (CGFloat)getHeight
{
    return 148. ;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
