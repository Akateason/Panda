//
//  HotProductCell.h
//  GroupBuying
//
//  Created by teason on 16/9/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_HotProductListCell = @"HotProductListCell" ;
#define Height_HotProductCell               APP_WIDTH * 465 / 750 + 15

@interface HotProductListCell : UITableViewCell

@property (nonatomic) int index ;

@end
