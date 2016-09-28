//
//  MineUserInfoCell.h
//  GroupBuying
//
//  Created by TuTu on 16/9/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_MineUserInfoCell = @"MineUserInfoCell" ;

typedef void(^ToMyNotes)(void) ;
typedef void(^ToMyFoucus)(void) ;
typedef void(^ToMyFans)(void) ;
typedef void(^ToMyPage)(void) ;

@interface MineUserInfoCell : UITableViewCell

@property (nonatomic,copy) ToMyNotes    block_note ;
@property (nonatomic,copy) ToMyFoucus   block_focus ;
@property (nonatomic,copy) ToMyFans     block_fans ;
@property (nonatomic,copy) ToMyPage     block_page ;

@end
