//
//  PointsCell.m
//  GroupBuying
//
//  Created by TuTu on 16/10/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PointsCell.h"

@interface PointsCell ()

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbTime;
@property (weak, nonatomic) IBOutlet UILabel *lbPoint;

@end

@implementation PointsCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _lbTitle.textColor = [UIColor xt_w_dark] ;
    _lbTime.textColor = [UIColor xt_w_desc] ;
    _lbPoint.textColor = [UIColor xt_tabbarRedColor] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
