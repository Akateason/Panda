//
//  RankingCell.m
//  GroupBuying
//
//  Created by TuTu on 16/8/23.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RankingCell.h"

@interface RankingCell ()

@property (weak, nonatomic) IBOutlet UIView *topline;
@property (weak, nonatomic) IBOutlet UIView *wback;
@property (weak, nonatomic) IBOutlet UIView *leftRed;

@property (weak, nonatomic) IBOutlet UILabel *labelRanking;
@property (weak, nonatomic) IBOutlet UIView *seperateLine;

@property (weak, nonatomic) IBOutlet UIImageView *userHeadImageView;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelDescrip;
@property (weak, nonatomic) IBOutlet UIButton *btFoucus;

@end

@implementation RankingCell

- (IBAction)btFoucusOnClick:(id)sender
{
    
}

- (void)awakeFromNib
{
    _topline.backgroundColor = [UIColor xt_seperate] ;
    _wback.backgroundColor = [UIColor whiteColor] ;
    _leftRed.backgroundColor = [UIColor xt_tabbarRedColor] ;
    _labelRanking.textColor = [UIColor xt_w_dark] ;
    _seperateLine.backgroundColor = [UIColor xt_seperate] ;
    
    _userHeadImageView.layer.cornerRadius = _userHeadImageView.frame.size.height / 2. ;
    _userHeadImageView.layer.masksToBounds = YES ;
    
    _labelName.textColor = [UIColor xt_tabbarRedColor] ;
    _labelDescrip.textColor = [UIColor xt_w_desc] ;
    [_btFoucus setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btFoucus.layer.borderColor = [UIColor xt_w_dark].CGColor ;
    _btFoucus.layer.borderWidth = 1. ;
    _btFoucus.layer.cornerRadius = 5. ;
}

@end
