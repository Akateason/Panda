//
//  Article.h
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic,copy)      NSString    *idArticle ;
@property (nonatomic,copy)      NSString    *title ;
@property (nonatomic,strong)    NSArray     *picItems ; // 图片信息(ArticlePicItem对象数组)
@property (nonatomic,copy)      NSString    *content ;
@property (nonatomic)           long long   createTime ;
@property (nonatomic,copy)      NSString    *createrId ;
@property (nonatomic)           long long   updateTime ;
@property (nonatomic,copy)      NSString    *updaterId ;
@property (nonatomic,copy)      NSString    *type ; // 类型(个人笔记)允许值: "NOTE"
@property (nonatomic,copy)      NSString    *status ; // 状态(已发布，已归档) 允许值: "PUBLISH", "ARCHIVE"
@property (nonatomic)           long        viewCnt ; // 浏览数（创建时无需传值）
@property (nonatomic)           long        upvoteCnt ; // 点赞数（创建时无需传值）
@property (nonatomic)           long        favoriteCnt ; // 收藏数（创建时无需传值）commentCnt 可选	number
@property (nonatomic)           long        commentCnt ; // 分享数（创建时无需传值）
@property (nonatomic,strong)    NSArray     *tags ; //文章标签数组
@property (nonatomic)           int         isOrderArticle ; //是否是可购买的笔记（0 不是 1 是）（创建时无需传值）






@end
