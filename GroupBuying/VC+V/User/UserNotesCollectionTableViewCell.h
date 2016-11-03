//
//  UserNotesCollectionTableViewCell.h
//  GroupBuying
//
//  Created by TuTu on 16/8/29.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageCollectionCellHeader.h"
@class NoteListViewItem ;

static NSString *idUserNotesCollectionTableViewCell = @"UserNotesCollectionTableViewCell" ;

@protocol UserNotesCollectionTableViewCellDelegate <HomePageCollectionCellDelegate>
- (void)noteSelected:(NoteListViewItem *)note ;
@end

@interface UserNotesCollectionTableViewCell : UITableViewCell
@property (nonatomic,weak) id <UserNotesCollectionTableViewCellDelegate> delegate ;
@property (nonatomic,strong) NSArray *noteItems ;
+ (float)getHeightWithCount:(NSInteger)count ;
@end
