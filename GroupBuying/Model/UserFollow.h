//
//  UserFollow.h
//  GroupBuying
//
//  Created by TuTu on 16/10/27.
//  Copyright © 2016年 teason. All rights reserved.
//id	string
//ID.
//
//fromUserId	string
//发起用户ID
//
//fromUserInfo	object
//发起用户信息（User对象）
//
//toUserId	string
//被关注用户ID
//
//toUserInfo	object
//被关注用户信息（User对象）
//
//isBoth	number
//是否是双方关注（0 不是， 1 是）

#import <Foundation/Foundation.h>
@class User ;

@interface UserFollow : NSObject

@property (nonatomic,copy) NSString *isUser ;
@property (nonatomic,copy) NSString *fromUserId ;
@property (nonatomic,strong) User   *fromUserInfo ;
@property (nonatomic,copy) NSString *toUserId ;
@property (nonatomic,strong) User   *toUserInfo ;
@property (nonatomic) int           isBoth ;

@end
