//
//  MEDAVCtextfieldCell.m
//  GroupBuying
//
//  Created by TuTu on 16/10/11.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MEDAVCtextfieldCell.h"

@interface MEDAVCtextfieldCell ()


@end

@implementation MEDAVCtextfieldCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    self.backgroundColor = [UIColor xt_seperate] ;
    _textfield.layer.cornerRadius = 5. ;
    _textfield.backgroundColor = [UIColor whiteColor] ;
    [_textfield becomeFirstResponder] ;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder ;
    _textfield.placeholder = placeholder ;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
