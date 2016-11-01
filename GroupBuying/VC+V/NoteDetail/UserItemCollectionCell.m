//
//  UserItemCollectionCell.m
//  GroupBuying
//
//  Created by teason on 16/9/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UserItemCollectionCell.h"
#import "UserFollowViewItem.h"
#import "UserFollow.h"
#import "User.h"
#import "UIImageView+SDQN.h"
#import "FocusHandler.h"
#import "UIImage+AddFunction.h"

@interface UserItemCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userHeadPic;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIButton *btFocus;

@end

@implementation UserItemCollectionCell


- (void)setFollowItem:(UserFollowViewItem *)followItem
{
    _followItem = followItem ;
    
    _usernameLabel.text = followItem.followInfo.toUserInfo.nickName ;
    
    [_userHeadPic xt_setCircleImageWithPic:followItem.followInfo.toUserInfo.headPic
                          placeHolderImage:IMG_HEAD_NO] ;
    
    _btFocus.selected = followItem.isFollow ;
}


- (IBAction)btFoucusOnClick:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(followUserBtOnClickWithCreaterID:followed:)]) {
        BOOL hasLogin = [self.delegate followUserBtOnClickWithCreaterID:self.followItem.followInfo.toUserId followed:!sender.selected] ;
        if (hasLogin) {
            sender.selected = !sender.selected ;
            NSLog(@"btfocus ") ;
        }
    }
}

- (void)tapHeadImg
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(userheadOnClickWithUserID:userName:)]) {
        [self.delegate userheadOnClickWithUserID:self.followItem.followInfo.toUserId
                                        userName:self.followItem.followInfo.toUserInfo.nickName] ;
        NSLog(@"头像") ;
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
//    _userHeadPic.layer.cornerRadius = _userHeadPic.frame.size.width / 2 ;
//    _userHeadPic.layer.masksToBounds = YES ;
    _usernameLabel.textColor = [UIColor xt_w_dark] ;
    [_btFocus setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btFocus.backgroundColor = [UIColor whiteColor] ;
    _btFocus.layer.borderColor = [UIColor xt_w_dark].CGColor ;
    _btFocus.layer.borderWidth = 1. ;
    _btFocus.layer.cornerRadius = 5. ;
    [FocusHandler configureFocusButtonsTitlesWithButton:_btFocus] ;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHeadImg)] ;
    [_userHeadPic addGestureRecognizer:tapGesture] ;
}

@end
