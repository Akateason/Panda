//
//  COVCPostCostCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/23.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "COVCPostCostCell.h"

@interface COVCPostCostCell ()

@property (weak, nonatomic) IBOutlet UIView *v1;
@property (weak, nonatomic) IBOutlet UIView *v2;
@property (weak, nonatomic) IBOutlet UIView *vBase;
@property (weak, nonatomic) IBOutlet UILabel *lb_freight_key;
@property (weak, nonatomic) IBOutlet UILabel *lb_freight_val;
@property (weak, nonatomic) IBOutlet UILabel *lb_poster_key;
@property (weak, nonatomic) IBOutlet UILabel *lb_poster_val;

@end

@implementation COVCPostCostCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _v1.backgroundColor = [UIColor whiteColor] ;
    _v2.backgroundColor = [UIColor whiteColor] ;
    _vBase.backgroundColor = [UIColor xt_seperate] ;
    
    _lb_poster_key.textColor = [UIColor xt_w_light] ;
    _lb_freight_key.textColor = [UIColor xt_w_light] ;
    _lb_poster_val.textColor = [UIColor xt_w_dark] ;
    _lb_freight_val.textColor = [UIColor xt_w_dark] ;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
