//
//  DefaultAddressCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DefaultAddressCell.h"

@interface DefaultAddressCell ()
@property (weak, nonatomic) IBOutlet UIButton *btDefaultAddress;
@property (weak, nonatomic) IBOutlet UIView *seperateLine;

@end

@implementation DefaultAddressCell

#pragma mark - action
- (IBAction)BtDefaultAddressOnClick:(UIButton *)sender
{
    NSLog(@"default address") ;
    sender.selected = !sender.selected ;
}

#pragma mark - life
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _seperateLine.backgroundColor = [UIColor xt_seperate] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
