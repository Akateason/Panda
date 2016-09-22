//
//  MineUserInfoCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MineUserInfoCell.h"

@interface MineUserInfoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userHead;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelDesc;
@property (weak, nonatomic) IBOutlet UIView *upline;
@property (weak, nonatomic) IBOutlet UIView *leftline;
@property (weak, nonatomic) IBOutlet UIView *rightline;

@property (weak, nonatomic) IBOutlet UILabel *lb_mynote;
@property (weak, nonatomic) IBOutlet UILabel *lb_myFocus;
@property (weak, nonatomic) IBOutlet UILabel *lb_myFans;


@end

@implementation MineUserInfoCell

- (IBAction)myNoteOnClick:(id)sender {
    NSLog(@"我的笔记") ;
}
- (IBAction)myFocusOnClick:(id)sender {
    NSLog(@"我的关注") ;
}
- (IBAction)myFansOnClick:(id)sender {
    NSLog(@"我的粉丝") ;
}

- (IBAction)myHomePageOnClick:(id)sender
{
    NSLog(@"我的主页") ;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    _upline.backgroundColor = [UIColor xt_seperate] ;
    _leftline.backgroundColor = [UIColor xt_seperate] ;
    _rightline.backgroundColor = [UIColor xt_seperate] ;
    
    _labelName.textColor = [UIColor xt_w_dark] ;
    _labelDesc.textColor = [UIColor xt_w_light] ;
    _lb_mynote.textColor = [UIColor xt_w_light] ;
    _lb_myFocus.textColor = [UIColor xt_w_light] ;
    _lb_myFans.textColor = [UIColor xt_w_light] ;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
