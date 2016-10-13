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


- (void)setIdxRank:(int)idxRank
{
    _idxRank = idxRank ;
    
    int numRank = idxRank + 1 ;
    _lbRank.text = [NSString stringWithFormat:@"%d",numRank] ;
    
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
    
}


#define kCellWid        (APP_WIDTH - 2.) / 3.

+ (CGSize)getSize
{
    return CGSizeMake( kCellWid , kCellWid * 200. / 125. ) ;
}


- (void)awakeFromNib
{
    [super awakeFromNib] ;
    // Initialization code
    [_btHowmanyLike setTitleColor:[UIColor xt_w_dark] forState:0] ;
}

@end
