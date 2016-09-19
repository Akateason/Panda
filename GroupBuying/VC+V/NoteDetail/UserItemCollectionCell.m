//
//  UserItemCollectionCell.m
//  GroupBuying
//
//  Created by teason on 16/9/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UserItemCollectionCell.h"

@interface UserItemCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userHeadPic;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIButton *btFocus;

@end

@implementation UserItemCollectionCell

- (IBAction)btFoucusOnClick:(id)sender
{
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _usernameLabel.textColor = [UIColor xt_w_dark] ;
    [_btFocus setTitleColor:[UIColor xt_w_dark] forState:0] ;
}

@end
