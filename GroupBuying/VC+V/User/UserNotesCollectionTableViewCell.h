//
//  UserNotesCollectionTableViewCell.h
//  GroupBuying
//
//  Created by TuTu on 16/8/29.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *idUserNotesCollectionTableViewCell = @"UserNotesCollectionTableViewCell" ;

@interface UserNotesCollectionTableViewCell : UITableViewCell

+ (float)getHeightWithCount:(NSInteger)count ;

@end
