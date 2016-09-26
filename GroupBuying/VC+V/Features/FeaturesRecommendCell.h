//
//  FeaturesRecommendCell.h
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_FeaturesRecommendCell = @"FeaturesRecommendCell" ;

@interface FeaturesRecommendCell : UITableViewCell

+ (float)getHeightWithCount:(NSInteger)count ;

@end
