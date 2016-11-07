//
//  MyActivityCell.h
//  GroupBuying
//
//  Created by TuTu on 16/11/7.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_MyActivityCell = @"MyActivityCell" ;

@interface MyActivityCell : UITableViewCell
@property (nonatomic) int index ;
+ (CGFloat)getHeight ;
@end
