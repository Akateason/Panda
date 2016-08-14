//
//  ArticleComment.h
//  SuBaoJiang
//
//  Created by apple on 15/6/5.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#import "YYModel.h"
@class User ;

@interface ArticleComment : NSObject

@property (nonatomic,strong)    User        *userCurrent ;
@property (nonatomic)           int         c_id ;
@property (nonatomic,copy)      NSString    *c_content ;
@property (nonatomic,copy)      NSString    *c_color ;
@property (nonatomic,copy)      NSString    *c_size ;
@property (nonatomic,copy)      NSString    *c_position ;
@property (nonatomic)           long long   c_createtime ;
@property (nonatomic)           BOOL        is_author ;
@property (nonatomic)           int         reply_u_id ;
@property (nonatomic)           int         a_id ;
@property (nonatomic,copy)      NSString    *img ;
@property (nonatomic,copy)      NSString    *reply_u_nickname ;
@property (nonatomic,copy)      NSString    *showStrComment ;
@property (nonatomic)           BOOL        isPostedImmediately ; // controlling fly word's border show or not . DEFAULT is NO .

@end
