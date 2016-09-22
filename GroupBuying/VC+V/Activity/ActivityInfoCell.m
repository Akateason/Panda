//
//  ActivityInfoCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ActivityInfoCell.h"

@interface ActivityInfoCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *baominLabel;
@property (weak, nonatomic) IBOutlet UILabel *howmanybaominLabel; // 已报名多少人
@property (weak, nonatomic) IBOutlet UIButton *btJoin;

@end

@implementation ActivityInfoCell

- (IBAction)btJoinOnClick:(id)sender
{
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _titleLabel.textColor = [UIColor xt_w_dark] ;
    _timeLabel.textColor = [UIColor xt_w_desc] ;
    _baominLabel.textColor = [UIColor xt_w_desc] ;
    _howmanybaominLabel.textColor = [UIColor xt_w_desc] ;
    
    [_btJoin setTitleColor:[UIColor whiteColor] forState:0];
    _btJoin.backgroundColor = [UIColor xt_tabbarRedColor] ;
    _btJoin.layer.cornerRadius = 5. ;
}


+ (float)getHeight
{
    return 100 + (APP_WIDTH - 2*18) * 964 / 678 + 20 ;
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
