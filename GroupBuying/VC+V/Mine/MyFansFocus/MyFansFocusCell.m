//
//  MyFansFocusCell.m
//  GroupBuying
//
//  Created by TuTu on 16/10/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyFansFocusCell.h"
#import "UserFollowViewItem.h"
#import "UserFollow.h"
#import "User.h"
#import "UIImageView+SDQN.h"

@interface MyFansFocusCell ()
@property (weak, nonatomic) IBOutlet UILabel *lb_name;
@property (weak, nonatomic) IBOutlet UILabel *lb_desc;
@property (weak, nonatomic) IBOutlet UIImageView *img_userhead;
@property (weak, nonatomic) IBOutlet UIButton *btFocus;

@end

@implementation MyFansFocusCell


- (void)setUserViewItem:(UserFollowViewItem *)userViewItem
{
    _userViewItem = userViewItem ;
    
    
    if (self.displayType == type_focus) {
        [_img_userhead xt_setImageWithPic:userViewItem.followInfo.toUserInfo.headPic
                         placeHolderImage:IMG_HEAD_NO] ;
        _lb_name.text = userViewItem.followInfo.toUserInfo.nickName ;
        _lb_desc.text = userViewItem.followInfo.toUserInfo.intruduce ;
    }
    else if (self.displayType == type_fans) {
        [_img_userhead xt_setImageWithPic:userViewItem.followInfo.fromUserInfo.headPic
                         placeHolderImage:IMG_HEAD_NO] ;
        _lb_name.text = userViewItem.followInfo.fromUserInfo.nickName ;
        _lb_desc.text = userViewItem.followInfo.fromUserInfo.intruduce ;
    }
    
    _btFocus.selected = userViewItem.isFollow ;
}



- (IBAction)btFocusOnClick:(id)sender
{
    NSLog(@"btfocus ") ;
    
    
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    _lb_name.textColor = [UIColor xt_tabbarRedColor] ;
    _lb_desc.textColor = [UIColor xt_w_desc] ;
    _img_userhead.layer.cornerRadius = CGWidth(_img_userhead.frame) / 2. ;
    _img_userhead.layer.masksToBounds = YES ;
    
    [_btFocus setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btFocus.layer.borderWidth = 1. ;
    _btFocus.layer.borderColor = [UIColor xt_w_dark].CGColor ;
    _btFocus.layer.cornerRadius = 5. ;
}







- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
