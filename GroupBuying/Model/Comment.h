//
//  Comment.h
//  GroupBuying
//
//  Created by TuTu on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property (nonatomic,copy)  NSString    *idComment ;
@property (nonatomic,copy)  NSString    *content ;
@property (nonatomic)       long long   createTime ;
@property (nonatomic,copy)  NSString    *createrId ;
@property (nonatomic,copy)  NSString    *createName ;
@property (nonatomic,copy)  NSString    *objectType ;   // 评论对象类型(个人笔记) 允许值: "NOTE"
@property (nonatomic,copy)  NSString    *objectId ;     // 评论对象ID

@end
