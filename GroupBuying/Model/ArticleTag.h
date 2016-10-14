//
//  ArticleTag.h
//  GroupBuying
//
//  Created by TuTu on 16/10/14.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Pic ;

@interface ArticleTag : NSObject

@property (nonatomic,copy)      NSString    *idArticleTag ;
@property (nonatomic,copy)      NSString    *name ;
@property (nonatomic,copy)      NSString    *type ; //"NOTE"
@property (nonatomic,strong)    Pic         *img ; // 可选
@property (nonatomic)           int         sort ; // 可选 排序
@property (nonatomic)           long long   createTime ; // 可选
@property (nonatomic)           long long   updateTime ; // 可选

@end
