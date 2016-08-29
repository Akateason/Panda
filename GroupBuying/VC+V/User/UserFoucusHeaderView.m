//
//  UserFoucusHeaderView.m
//  GroupBuying
//
//  Created by TuTu on 16/8/29.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UserFoucusHeaderView.h"

@interface UserFoucusHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *labelHisNote;
@property (weak, nonatomic) IBOutlet UIButton *btFoucus;

@end

@implementation UserFoucusHeaderView

- (IBAction)btFoucusOnClick:(id)sender
{
    
}

- (void)awakeFromNib
{
    _labelHisNote.textColor = [UIColor xt_w_dark] ;
    [_btFoucus setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btFoucus.layer.borderWidth = 1. ;
    _btFoucus.layer.borderColor = [UIColor xt_w_dark].CGColor ;
    _btFoucus.layer.cornerRadius = 5. ;

    UIView *bView = [[UIView alloc] initWithFrame:self.frame] ;
    bView.backgroundColor = [UIColor whiteColor] ;
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
