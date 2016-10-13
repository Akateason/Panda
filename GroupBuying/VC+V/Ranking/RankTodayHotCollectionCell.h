//
//  RankTodayHotCollectionCell.h
//  GroupBuying
//
//  Created by TuTu on 16/10/12.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_RankTodayHotCollectionCell = @"RankTodayHotCollectionCell" ;

@interface RankTodayHotCollectionCell : UICollectionViewCell

@property (nonatomic)   int     idxRank ;
+ (CGSize)getSize ;

@end
