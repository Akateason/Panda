//
//  MyFansFocusCell.h
//  GroupBuying
//
//  Created by TuTu on 16/10/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicEnum.h"
#import "BigPhotoHeaderViewProtocolHeader.h"

static NSString *const kID_MyFansFocusCell = @"MyFansFocusCell" ;
static const float kHeight_MyFansFocusCell = 75. ;

@class UserFollowViewItem ;

@interface MyFansFocusCell : UITableViewCell
@property (nonatomic,weak) id <HPBigPhotoHeaderViewDelegate> delegate ;
@property (nonatomic) DISPLAY_TYPE_MFFVC displayType ;
@property (strong,nonatomic) UserFollowViewItem *userViewItem ;
@end
