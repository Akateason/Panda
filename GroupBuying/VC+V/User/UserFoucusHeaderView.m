//
//  UserFoucusHeaderView.m
//  GroupBuying
//
//  Created by TuTu on 16/8/29.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UserFoucusHeaderView.h"
#import "UserViewItem.h"
#import "FocusHandler.h"
#import "User.h"
#import "UserOnDevice.h"

@interface UserFoucusHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *labelHisNote;
@property (weak, nonatomic) IBOutlet UIButton *btFoucus;

@end

@implementation UserFoucusHeaderView

- (IBAction)btFoucusOnClick:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(followUserBtOnClickWithCreaterID:followed:)]) {
        BOOL hasLogin = [self.delegate followUserBtOnClickWithCreaterID:self.userItem.userInfo.userId followed:!sender.selected] ;
        if (hasLogin) {
            sender.selected = !sender.selected ;
            NSLog(@"btfocus ") ;
        }
    }
}

- (void)setUserItem:(UserViewItem *)userItem
{
    _userItem = userItem ;
    
    if (!userItem) return ;
    
    _btFoucus.selected = userItem.isFollow ;
    _btFoucus.hidden = [UserOnDevice checkUserIsOwnerWithUserID:userItem.userInfo.userId] ;
}

- (void)awakeFromNib
{
    _labelHisNote.textColor = [UIColor xt_w_dark] ;
    [_btFoucus setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btFoucus.layer.borderWidth = 1. ;
    _btFoucus.layer.borderColor = [UIColor xt_w_dark].CGColor ;
    _btFoucus.layer.cornerRadius = 5. ;
    [FocusHandler configureFocusButtonsTitlesWithButton:_btFoucus] ;
    
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
