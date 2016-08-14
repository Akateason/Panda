//
//  Article.h
//  SuBaoJiang
//
//  Created by apple on 15/6/5.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#import "YYModel.h"

@class User ;
@class ArticleComment ;
@class ArticlePraise ;

@interface Article : NSObject

@property (nonatomic)           int             a_id ;
@property (nonatomic,copy)      NSString        *img ;
@property (nonatomic,copy)      NSString        *a_content ;   //文章文字
@property (nonatomic)           long long       a_updatetime ; //审核通过,正式发布时间
@property (nonatomic)           long long       a_createtime ; //本地发布时间

@property (nonatomic,strong)    User            *userCurrent ;

@property (nonatomic,strong)    NSMutableArray  *articleCommentList ; // 评论list
@property (nonatomic)           int             article_comments_count ; //总评论数

@property (nonatomic)           BOOL            has_praised	;  // 当前用户(我)是否点赞过

@property (nonatomic)           BOOL            is_author   ;  // 是否作者
@property (nonatomic,strong)    NSArray         *praiseList ;  // 点赞人list
@property (nonatomic)           int             praiseCount ;  // 点赞总数

@property (nonatomic,copy)      NSString        *a_title    ;       // 多图标题 (是多图才有)
@property (nonatomic,copy)      NSString        *ac_content ;       // 分类名称
@property (nonatomic,strong)    NSArray         *childList  ;       // 文章子集 (是多图才有)

@end
