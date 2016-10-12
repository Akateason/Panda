//
//  RankingUserCell.m
//  GroupBuying
//
//  Created by TuTu on 16/10/12.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RankingUserCell.h"
#import "TestUser.h"

@interface RankingUserCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgHead;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbDesc;
@property (weak, nonatomic) IBOutlet UIButton *btFocus;
@property (weak, nonatomic) IBOutlet UIImageView *imgRankBg;
@property (weak, nonatomic) IBOutlet UIImageView *imgOrder;
@property (weak, nonatomic) IBOutlet UILabel *lbRank;

@end

@implementation RankingUserCell

- (void)setIndex:(int)index
{
    _index = index ;
    
    _imgHead.image = [UIImage imageNamed:[TestUser headImage:index]] ;
    _lbName.text = [TestUser username:index] ;
    _lbRank.text = [NSString stringWithFormat:@"%d",index + 1] ;
    _lbDesc.text = @"很高兴认识你" ;
}

- (IBAction)btFocusOnClick:(UIButton *)sender
{
    sender.selected = !sender.selected ;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    [_btFocus setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btFocus.layer.borderColor = [UIColor xt_w_dark].CGColor ;
    _btFocus.layer.borderWidth = 1. ;
    _btFocus.layer.cornerRadius = 5. ;
    
    _imgHead.layer.cornerRadius = _imgHead.frame.size.height / 2. ;
    _imgHead.layer.masksToBounds = YES ;
    
    _lbName.textColor = [UIColor xt_tabbarRedColor] ;
    _lbDesc.textColor = [UIColor xt_w_desc] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
