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
#import "FocusHandler.h"
#import "UserOnDevice.h"

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
    
    if (!userViewItem) return ;
    
    NSString *userID = nil ;
    if (self.displayType == type_focus) {
        [_img_userhead xt_setImageWithPic:userViewItem.followInfo.toUserInfo.headPic
                         placeHolderImage:IMG_HEAD_NO] ;
        _lb_name.text = userViewItem.followInfo.toUserInfo.nickName ;
        _lb_desc.text = userViewItem.followInfo.toUserInfo.intruduce ;
        userID = userViewItem.followInfo.toUserId ;
    }
    else if (self.displayType == type_fans) {
        [_img_userhead xt_setImageWithPic:userViewItem.followInfo.fromUserInfo.headPic
                         placeHolderImage:IMG_HEAD_NO] ;
        _lb_name.text = userViewItem.followInfo.fromUserInfo.nickName ;
        _lb_desc.text = userViewItem.followInfo.fromUserInfo.intruduce ;
        userID = userViewItem.followInfo.fromUserId ;
    }
    
    _btFocus.selected = userViewItem.isFollow ;
    _btFocus.hidden = [userID isEqualToString:[UserOnDevice currentUserOnDevice].userId] ;
    [FocusHandler configureFocusButton:_btFocus IsBothOrNomal:self.userViewItem.followInfo.isBoth] ;
}



- (IBAction)btFocusOnClick:(UIButton *)sender
{
    
    NSString *createrID = nil ;
    if (self.displayType == type_focus) {
        createrID = self.userViewItem.followInfo.toUserId ;
    }
    else if (self.displayType == type_fans) {
        createrID = self.userViewItem.followInfo.fromUserId ;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(followUserBtOnClickWithCreaterID:followed:)]) {
        BOOL hasLogin = [self.delegate followUserBtOnClickWithCreaterID:createrID followed:!sender.selected] ;
        if (hasLogin) {
            sender.selected = !sender.selected ;
            NSLog(@"btfocus ") ;
        }
    }
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
    
    [FocusHandler configureFocusButtonsTitlesWithButton:_btFocus] ; // +关注. 已关注
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHead)] ;
    [_img_userhead addGestureRecognizer:tapGesture] ;
}

- (void)clickHead
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(userheadOnClickWithUserID:userName:)]) {
        NSString *createrID = nil ;
        if (self.displayType == type_focus) {
            createrID = self.userViewItem.followInfo.toUserId ;
        }
        else if (self.displayType == type_fans) {
            createrID = self.userViewItem.followInfo.fromUserId ;
        }
        [self.delegate userheadOnClickWithUserID:createrID userName:nil] ;
    }
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
