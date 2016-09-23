//
//  SettingCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/23.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "SettingCell.h"

@interface SettingCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgArrow;

@end

@implementation SettingCell

- (void)setDisplayStr:(NSString *)displayStr
{
    _displayStr = displayStr ;
    
    if (!displayStr) {
        return ;
    }
    self.titleLabel.text = displayStr ;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _titleLabel.textColor = [UIColor xt_w_dark] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
