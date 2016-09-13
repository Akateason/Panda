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

@property (nonatomic,copy)  NSString    *idOwn ;
@property (nonatomic,copy)  NSString    *userId ;
@property (nonatomic,copy)  NSString    *nickName ;
@property (nonatomic,copy)  NSString    *email ;
@property (nonatomic,copy)  NSString    *mobile ;
@property (nonatomic,copy)  NSString    *status ;
@property (nonatomic,copy)  NSString    *type ;
@property (nonatomic,copy)  NSString    *gender ;
@property (nonatomic,copy)  NSString    *name ;
@property (nonatomic)       long long   createTime ;
@property (nonatomic)       long long   updateTime ;
@property (nonatomic)       long long   lastLoginTime ;
@property (nonatomic,strong)Pic         *headPic ;

@end
