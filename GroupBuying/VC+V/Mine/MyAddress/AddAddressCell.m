//
//  AddAddressCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "AddAddressCell.h"

@interface AddAddressCell ()
@property (weak, nonatomic) IBOutlet UILabel *lb_keyname;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@end

@implementation AddAddressCell

- (void)setIndexpathRow:(int)indexpathRow
{
    _indexpathRow = indexpathRow ;
    
    switch (indexpathRow) {
        case 0:
        {
            self.lb_keyname.text = @"收货人" ;
            self.textfield.placeholder = @"请输入收货人名称" ;
            self.textfield.keyboardType = UIKeyboardTypeDefault ;
        }
            break;
        case 1:
        {
            self.lb_keyname.text = @"手机号码" ;
            self.textfield.placeholder = @"请输入手机号" ;
            self.textfield.keyboardType = UIKeyboardTypePhonePad ;
        }
            break;
        case 2:
        {
            self.lb_keyname.text = @"国家" ;
            self.textfield.placeholder = @"请输入国家" ;
            self.textfield.keyboardType = UIKeyboardTypeDefault ;
        }
            break;
        case 3:
        {
            self.lb_keyname.text = @"省市区" ;
            self.textfield.placeholder = @"请输入省市区" ;
            self.textfield.keyboardType = UIKeyboardTypeDefault ;
        }
            break;
        case 4:
        {
            self.lb_keyname.text = @"详细地址" ;
            self.textfield.placeholder = @"请输入详细地址" ;
            self.textfield.keyboardType = UIKeyboardTypeDefault ;
        }
            break;
        case 5:
        {
            self.lb_keyname.text = @"邮政编码" ;
            self.textfield.placeholder = @"请输入邮政编码" ;
            self.textfield.keyboardType = UIKeyboardTypeNumberPad ;
        }
            break;
        default:
            break;
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _lb_keyname.textColor = [UIColor xt_w_dark] ;
    _textfield.textColor = [UIColor xt_w_dark] ;
    _textfield.backgroundColor = [UIColor whiteColor] ;
    UIView *baseLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGHeight(self.frame) - 1, APP_WIDTH, 1)] ;
    baseLine.backgroundColor = [UIColor xt_seperate] ;
    [self addSubview:baseLine] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
