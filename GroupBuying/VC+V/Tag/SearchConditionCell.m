//
//  SearchConditionCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/4.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "SearchConditionCell.h"

@implementation SearchConditionCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _lbTitle.textColor = [UIColor xt_w_dark] ;
    
    self.tintColor = [UIColor xt_tabbarRedColor] ;
    UIView *topline = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, 1)] ;
    topline.backgroundColor = [UIColor xt_seperate] ;
    [self addSubview:topline] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
