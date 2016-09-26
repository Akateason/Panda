//
//  FeaturesProductsCell.h
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_FeaturesProductsCell = @"FeaturesProductsCell" ;

@interface FeaturesProductsCell : UITableViewCell

+ (float)getHeight ;

@property (nonatomic) int  index ;

@end
