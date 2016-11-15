//
//  ODVCAddressCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ODVCAddressCell.h"
#import "NSString+Extend.h"

@interface ODVCAddressCell ()
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbAddress;
@property (weak, nonatomic) IBOutlet UILabel *lbPhone;
@property (weak, nonatomic) IBOutlet UIView *baseBar;
@end

@implementation ODVCAddressCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _lbName.textColor = [UIColor xt_w_dark] ;
    _lbAddress.textColor = [UIColor xt_w_dark] ;
    _lbPhone.textColor = [UIColor xt_w_dark] ;
    _baseBar.backgroundColor = [UIColor xt_seperate] ;
    
    _lbName.text = @"tianchen" ;
    _lbPhone.text = @"150000000000" ;
    _lbAddress.text = @"中国 上海 杨新路 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" ;
}


+ (CGFloat)getHeightWithAddressStr:(NSString *)addressStr
{
    CGSize size = CGSizeMake(APP_WIDTH - 2 * 11., 100.) ;
    CGSize labelSize = [addressStr calculateWithOverSize:size systemFontSize:13.] ;
    CGFloat titleHeight = labelSize.height ;
    float height = 95 - 16 + titleHeight ;
    return height ;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
