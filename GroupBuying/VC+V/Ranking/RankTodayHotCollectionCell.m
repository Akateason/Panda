//
//  RankTodayHotCollectionCell.m
//  GroupBuying
//
//  Created by TuTu on 16/10/12.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RankTodayHotCollectionCell.h"

@interface RankTodayHotCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgProduct;
@property (weak, nonatomic) IBOutlet UIButton *btHowmanyLike;
@property (weak, nonatomic) IBOutlet UIImageView *imgRankBg;
@property (weak, nonatomic) IBOutlet UILabel *lbRank;

@end

@implementation RankTodayHotCollectionCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    [_btHowmanyLike setTitleColor:[UIColor xt_w_dark] forState:0] ;
}

@end
