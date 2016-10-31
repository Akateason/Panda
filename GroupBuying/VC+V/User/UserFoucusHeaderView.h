//
//  UserFoucusHeaderView.h
//  GroupBuying
//
//  Created by TuTu on 16/8/29.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BigPhotoHeaderViewProtocolHeader.h"
@class UserViewItem ;

static NSString *idUserFoucusHeaderView = @"UserFoucusHeaderView" ;

@interface UserFoucusHeaderView : UITableViewHeaderFooterView
@property (nonatomic,weak) id <HPBigPhotoHeaderViewDelegate> delegate ;
@property (nonatomic,strong) UserViewItem *userItem ;
@end
