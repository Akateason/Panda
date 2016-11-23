//
//  PaywayItemCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/23.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PaywayItemCell.h"

@interface PaywayItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView_payway;
@property (weak, nonatomic) IBOutlet UILabel *lb_way;
@property (weak, nonatomic) IBOutlet UIButton *btChoose;

@end

@implementation PaywayItemCell

- (IBAction)btChooseOnClick:(UIButton *)sender
{
    sender.selected = !sender.selected ;
    
}



- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _lb_way.textColor = [UIColor xt_w_dark] ;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
