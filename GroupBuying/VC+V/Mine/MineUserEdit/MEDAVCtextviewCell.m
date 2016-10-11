//
//  MEDAVCtextviewCell.m
//  GroupBuying
//
//  Created by TuTu on 16/10/11.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MEDAVCtextviewCell.h"

@interface MEDAVCtextviewCell ()

@end

@implementation MEDAVCtextviewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = [UIColor xt_seperate] ;
    _textview.layer.cornerRadius = 5. ;
    [_textview becomeFirstResponder] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
