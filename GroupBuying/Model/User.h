//
//  User.h
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Pic ;

@interface User : NSObject

@property (nonatomic,copy)  NSString    *userId ;       //id	string 用户ID.
@property (nonatomic,copy)  NSString    *userIdPanda ;  //userId 可选	string Panda网的用户ID
@property (nonatomic,copy)  NSString    *nickName ;
@property (nonatomic,copy)  NSString    *email ;
@property (nonatomic,copy)  NSString    *mobile ;
@property (nonatomic,copy)  NSString    *status ;
@property (nonatomic,copy)  NSString    *type ;
@property (nonatomic,copy)  NSString    *gender ;
@property (nonatomic,copy)  NSString    *name ;
@property (nonatomic)       long long   birthday ;
@property (nonatomic)       long long   createTime ;
@property (nonatomic)       long long   updateTime ;
@property (nonatomic)       long long   lastLoginTime ;
@property (nonatomic,strong)Pic         *headPic ;
@property (nonatomic,copy)  NSString    *deviceID ; // 设备ID（推送用）
@property (nonatomic)       int         isIOS ; // 是否是iOS操作系统（0 不是 1是）
@property (nonatomic,copy)  NSString    *osVersion ; // 操作系统版本信息
//@property (nonatomic,copy)  NSString    *signature ; // 个性签名
@property (nonatomic,copy)  NSString    *intruduce ; // 简介
@property (nonatomic)       int         followCnt ;
@property (nonatomic)       int         fansCnt ;
@property (nonatomic)       int         noteCnt ;
@property (nonatomic)       int         favoriteCnt ; //收藏总数
@property (nonatomic)       int         upvoteCnt ; //点赞总数
@property (nonatomic)       int         noteFavoriteCnt ; //文章被收藏总数
@property (nonatomic)       int         noteUpvoteCnt ; //文章被点赞总数

@end
