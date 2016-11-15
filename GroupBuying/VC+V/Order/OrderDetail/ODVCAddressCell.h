//
//  ODVCAddressCell.h
//  GroupBuying
//
//  Created by TuTu on 16/11/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * kID_ODVCAddressCell = @"ODVCAddressCell" ;

@interface ODVCAddressCell : UITableViewCell

+ (CGFloat)getHeightWithAddressStr:(NSString *)addressStr ;

@end
