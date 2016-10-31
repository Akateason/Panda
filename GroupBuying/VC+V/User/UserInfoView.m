//
//  UserInfoView.m
//  GroupBuying
//
//  Created by TuTu on 16/8/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UserInfoView.h"
#import "UIImageView+SDQN.h"
#import "User.h"

@interface UserInfoView ()

@property (weak, nonatomic) IBOutlet UIImageView *userHeadImageView;
@property (weak, nonatomic) IBOutlet UIImageView *levelImageView;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelPosition;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UIButton *btFans;
@property (weak, nonatomic) IBOutlet UIButton *btFocus;
@property (weak, nonatomic) IBOutlet UIView *mid_seperateLine;
@property (weak, nonatomic) IBOutlet UILabel *labelFocus;
@property (weak, nonatomic) IBOutlet UILabel *labelFans;
@property (weak, nonatomic) IBOutlet UIView *baseLine;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end


@implementation UserInfoView

#pragma -
- (void)setAUser:(User *)aUser
{
    _aUser = aUser ;
    if (!aUser) return ;
    
    [_userHeadImageView xt_setImageWithPic:aUser.headPic placeHolderImage:IMG_HEAD_NO] ;
    _labelName.text = aUser.nickName ;

    _labelDescription.text = aUser.intruduce ;
    _labelFocus.text = [NSString stringWithFormat:@"%d",aUser.followCnt] ;
    _labelFans.text = [NSString stringWithFormat:@"%d",aUser.fansCnt] ;
}

#pragma -
- (void)awakeFromNib
{
    _levelImageView.hidden = YES ;
    _labelPosition.hidden = YES ;
    
    self.backgroundColor = [UIColor clearColor] ;
    _userHeadImageView.layer.cornerRadius = _userHeadImageView.frame.size.height / 2. ;
    _userHeadImageView.layer.masksToBounds = YES ;
    _btFans.backgroundColor = [UIColor clearColor] ;
    _btFocus.backgroundColor = [UIColor clearColor] ;
    _mid_seperateLine.backgroundColor = [UIColor whiteColor] ;
    _baseLine.backgroundColor = [UIColor xt_seperate] ;
    
    _labelName.text = @"" ;
    _labelPosition.text = @"" ;
    _labelDescription.text = @"" ;
}

#pragma -
- (IBAction)btFansOnClick:(id)sender
{
    NSLog(@"他的粉丝") ;
    if (self.hisFans) {
        self.hisFans() ;
    }
}

- (IBAction)btFocusOnClick:(id)sender
{
    NSLog(@"他的关注") ;
    if (self.hisFocus) {
        self.hisFocus() ;
    }
}

#pragma -
+ (CGFloat)getHeight
{
    //  pic                      + baseline
    return APP_WIDTH * 35. / 75. + 15. ;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
