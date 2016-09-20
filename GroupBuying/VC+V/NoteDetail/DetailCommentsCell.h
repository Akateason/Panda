//
//  DetailCommentsCell.h
//  GroupBuying
//
//  Created by teason on 16/9/18.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_DetailCommentsCell = @"DetailCommentsCell" ;

@interface DetailCommentsCell : UITableViewCell

@property (nonatomic,strong) NSArray *comments ;

+ (CGFloat)calculateHeight:(NSArray *)comments ;

@end
