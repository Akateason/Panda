//
//  MyCouponCodeCell.m
//  GroupBuying
//
//  Created by TuTu on 16/10/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyCouponCodeCell.h"

@interface MyCouponCodeCell ()
@property (weak, nonatomic) IBOutlet UIView *v1;
@property (weak, nonatomic) IBOutlet UIImageView *imgUserhead;
@property (weak, nonatomic) IBOutlet UILabel *lbUsername;
@property (weak, nonatomic) IBOutlet UILabel *lbUserDesc;
@property (weak, nonatomic) IBOutlet UIView *v2;
@property (weak, nonatomic) IBOutlet UILabel *lbCouponCode;

@end

@implementation MyCouponCodeCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor xt_seperate] ;
    _v1.backgroundColor = [UIColor whiteColor] ;
    _v2.backgroundColor = [UIColor whiteColor] ;
    _imgUserhead.layer.cornerRadius = CGWidth(_imgUserhead.frame) / 2. ;
    _imgUserhead.layer.masksToBounds = YES ;
    _lbUsername.textColor = [UIColor xt_tabbarRedColor] ;
    _lbUserDesc.textColor = [UIColor xt_w_desc] ;
    _lbCouponCode.textColor = [UIColor xt_w_dark] ;
    
    
    
    _lbCouponCode.text = @"推荐码 : 342432423432aaa" ;
    _imgUserhead.image = [UIImage imageNamed:@"t_h_6"] ;
    _lbUsername.text = @"teason" ;
    _lbUserDesc.text = @"用户简介用户简介用户简介用户简介" ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
