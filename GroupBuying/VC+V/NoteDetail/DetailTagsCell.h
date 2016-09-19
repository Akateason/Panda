//
//  DetailTagsCell.h
//  GroupBuying
//
//  Created by teason on 16/9/18.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_DetailTagsCell = @"DetailTagsCell" ;

@interface DetailTagsCell : UITableViewCell

@property (nonatomic,strong) NSArray *tags ;

+ (CGFloat)calculateHeight:(NSArray *)tags ;

@end
