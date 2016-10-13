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
    
    int numRank = index + 1 ;
    
    _imgHead.image = [UIImage imageNamed:[TestUser headImage:index]] ;
    _lbName.text = [TestUser username:index] ;
    _lbRank.text = [NSString stringWithFormat:@"%d",numRank] ;
    _lbDesc.text = @"很高兴认识你" ;
    switch (numRank) {
        case 1:
        {
            _imgRankBg.image = [UIImage imageNamed:@"icon_ranking_first"] ;
        }
            break;
        case 2:
        {
            _imgRankBg.image = [UIImage imageNamed:@"icon_ranking_second"] ;
        }
            break;
        case 3:
        {
            _imgRankBg.image = [UIImage imageNamed:@"icon_ranking_third"] ;
        }
            break;
        default:
        {
            _imgRankBg.image = [UIImage imageNamed:@"icon_ranking_fourth"] ;
        }
            break;
    }
    
    
    int rate = numRank % 3 ;
    switch (rate) {
        case 0:
        {
            _imgOrder.image = [UIImage imageNamed:@"icon_ranking_dec"] ;
        }
            break;
        case 1:
        {
            _imgOrder.image = [UIImage imageNamed:@"icon_ranking_flat"] ;
        }
            break;
        case 2:
        {
            _imgOrder.image = [UIImage imageNamed:@"icon_ranking_rise"] ;
        }
            break;
        default:
            break;
    }
    
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
    _btFocus.backgroundColor = [UIColor whiteColor] ;
    
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
