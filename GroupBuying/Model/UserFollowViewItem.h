//
//  UserFollowViewItem.h
//  GroupBuying
//
//  Created by TuTu on 16/10/27.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserFollow ;

@interface UserFollowViewItem : NSObject

@property (nonatomic,strong) UserFollow *followInfo ;
@property (nonatomic) int               isFollow ;

@end
