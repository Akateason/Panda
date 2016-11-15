//
//  ODVCOrderNumCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ODVCOrderNumCell.h"

@interface ODVCOrderNumCell ()
@property (weak, nonatomic) IBOutlet UILabel *lbOrderNumber;
@property (weak, nonatomic) IBOutlet UILabel *lbOrderDate;
@property (weak, nonatomic) IBOutlet UIView *baseBar;
@end

@implementation ODVCOrderNumCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _lbOrderDate.textColor = [UIColor xt_w_dark] ;
    _lbOrderNumber.textColor = [UIColor xt_w_dark] ;
    _baseBar.backgroundColor = [UIColor xt_seperate] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
