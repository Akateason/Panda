//
//  UserItemCollectionCell.m
//  GroupBuying
//
//  Created by teason on 16/9/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UserItemCollectionCell.h"
#import "TestUser.h"

@interface UserItemCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userHeadPic;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIButton *btFocus;

@end

@implementation UserItemCollectionCell

- (void)setIndex:(int)index
{
    _index = index ;
    
    _userHeadPic.image = [UIImage imageNamed:[TestUser headImage:index]] ;
    _usernameLabel.text = [TestUser username:index] ;
}

- (IBAction)btFoucusOnClick:(id)sender
{
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _userHeadPic.layer.cornerRadius = _userHeadPic.frame.size.width / 2 ;
    _userHeadPic.layer.masksToBounds = YES ;
    _usernameLabel.textColor = [UIColor xt_w_dark] ;
    [_btFocus setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btFocus.backgroundColor = [UIColor whiteColor] ;
    _btFocus.layer.borderColor = [UIColor xt_w_dark].CGColor ;
    _btFocus.layer.borderWidth = 1. ;
}

@end
