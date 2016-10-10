//
//  Upvote.h
//  GroupBuying
//
//  Created by teason on 16/10/10.
//  Copyright © 2016年 teason. All rights reserved.
//  点赞信息

#import <Foundation/Foundation.h>
#import "Pic.h"

@interface Upvote : NSObject

@property (nonatomic,copy)  NSString    *id_Upvote ;
@property (nonatomic,copy)  NSString    *objectType ; // 点赞对象类型(个人笔记) 允许值: "NOTE"
@property (nonatomic,copy)  NSString    *objectId ; // string 点赞对象ID

@property (nonatomic)       long long   createTime ; // 可选	number创建时间 （创建时无需传值）
@property (nonatomic,copy)  NSString    *createrId ; // 可选 string 创建者ID（创建时无需传值）
@property (nonatomic,strong)Pic         *createrHead ; // 可选	object 创建人头像（pic对象）
@property (nonatomic,copy)  NSString    *createrName ; // 可选	string 创建人昵称（创建时无需传值）
@property (nonatomic,copy)  NSString    *objectDesc ; //可选	string 点赞对象描述
@property (nonatomic,strong)Pic         *objectPic ;  //可选	object 点赞对象图片（pic对象）

@end
