//
//  CartIntroductionFooterView.m
//  GroupBuying
//
//  Created by teason on 16/10/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "CartIntroductionFooterView.h"

@interface CartIntroductionFooterView ()
@property (weak, nonatomic) IBOutlet UIButton *btChoose;
@property (weak, nonatomic) IBOutlet UILabel *lb_introduction;
@end

@implementation CartIntroductionFooterView

- (IBAction)btChooseOnClick:(UIButton *)sender
{
    sender.selected = !sender.selected ;
}

- (void)awakeFromNib
{
    _lb_introduction.textColor = [UIColor xt_w_light] ;
    _lb_introduction.text = @"本人承诺所购商品是个人合理自用，并承担海关相关法律责任。" ;
    
    UIView *bView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, 30.)] ;
    bView.backgroundColor = [UIColor xt_seperate] ;
    self.backgroundView = bView ;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
