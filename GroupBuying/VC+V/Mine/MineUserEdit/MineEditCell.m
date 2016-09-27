//
//  MineEditCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MineEditCell.h"

@interface MineEditCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation MineEditCell

- (void)setStrTitle:(NSString *)strTitle
{
    _strTitle = strTitle ;
    
    _titleLabel.text = strTitle ;
}

- (void)setStrValue:(NSString *)strValue
{
    _strValue = strValue ;
    
    _contentLabel.text = strValue ;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _titleLabel.textColor = [UIColor xt_w_dark] ;
    _contentLabel.textColor = [UIColor xt_w_desc] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
