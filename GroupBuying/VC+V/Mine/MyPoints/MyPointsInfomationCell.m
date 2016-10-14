//
//  MyPointsInfomationCell.m
//  GroupBuying
//
//  Created by TuTu on 16/10/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyPointsInfomationCell.h"

@interface MyPointsInfomationCell ()

@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *lbt_currentUsePoints;
@property (weak, nonatomic) IBOutlet UILabel *lbv_currentUserPoints;
@property (weak, nonatomic) IBOutlet UILabel *lbtWillUsePoints;
@property (weak, nonatomic) IBOutlet UILabel *lbvWillUsePoints;
@property (weak, nonatomic) IBOutlet UILabel *lbtAllPoints;
@property (weak, nonatomic) IBOutlet UILabel *lbvAllPoints;

@end

@implementation MyPointsInfomationCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _lbtAllPoints.textColor = [UIColor xt_w_desc] ;
    _lbtWillUsePoints.textColor = [UIColor xt_w_desc] ;
    _lbt_currentUsePoints.textColor = [UIColor xt_w_desc] ;
    
    _lbv_currentUserPoints.textColor = [UIColor xt_tabbarRedColor] ;
    _lbvAllPoints.textColor = [UIColor xt_w_dark] ;
    _lbvWillUsePoints.textColor = [UIColor xt_w_dark] ;
    
    _line.backgroundColor = [UIColor xt_seperate] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
