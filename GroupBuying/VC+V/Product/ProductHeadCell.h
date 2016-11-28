//
//  ProductHeadCell.h
//  GroupBuying
//
//  Created by TuTu on 16/11/28.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_ProductHeadCell = @"ProductHeadCell" ;

@interface ProductHeadCell : UITableViewCell

+ (CGFloat)calculateHeightWithProductName:(NSString *)name ;

@end
