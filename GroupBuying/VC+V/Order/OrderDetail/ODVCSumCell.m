//
//  ODVCSumCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ODVCSumCell.h"

@interface ODVCSumCell ()

@property (weak, nonatomic) IBOutlet UILabel *lb_t_orderSum;
@property (weak, nonatomic) IBOutlet UILabel *lb_v_orderSum;
@property (weak, nonatomic) IBOutlet UILabel *lb_t_productSum;
@property (weak, nonatomic) IBOutlet UILabel *lb_v_productSum;
@property (weak, nonatomic) IBOutlet UILabel *lb_t_freight;
@property (weak, nonatomic) IBOutlet UILabel *lb_v_freight;

@end

@implementation ODVCSumCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    _lb_t_orderSum.textColor = [UIColor xt_w_light] ;
    _lb_t_productSum.textColor = [UIColor xt_w_light] ;
    _lb_t_freight.textColor = [UIColor xt_w_light] ;
    _lb_v_orderSum.textColor = [UIColor xt_w_dark] ;
    _lb_v_productSum.textColor = [UIColor xt_w_dark] ;
    _lb_v_freight.textColor = [UIColor xt_w_dark] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
