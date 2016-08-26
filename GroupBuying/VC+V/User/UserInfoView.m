//
//  UserInfoView.m
//  GroupBuying
//
//  Created by TuTu on 16/8/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UserInfoView.h"

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

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor] ;
    _userHeadImageView.layer.cornerRadius = _userHeadImageView.frame.size.height / 2. ;
    _userHeadImageView.layer.masksToBounds = YES ;
    _btFans.backgroundColor = [UIColor clearColor] ;
    _btFocus.backgroundColor = [UIColor clearColor] ;
    _mid_seperateLine.backgroundColor = [UIColor whiteColor] ;
    _baseLine.backgroundColor = [UIColor xt_seperate] ;
    
}

- (IBAction)btFansOnClick:(id)sender
{
    NSLog(@"他的粉丝") ;
}

- (IBAction)btFocusOnClick:(id)sender
{
    NSLog(@"他的关注") ;
}

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
