//
//  NoteListViewItem.h
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//  笔记列表展示对象（NoteListViewItem）



#import <Foundation/Foundation.h>
@class Pic ;

@interface NoteListViewItem : NSObject

@property (nonatomic)           NSString    *articleId ;
@property (nonatomic,strong)    Pic         *img ; //文章图片（pic对象）
@property (nonatomic,copy)      NSString    *articleTitle ;
@property (nonatomic)           long long   articleCreateTime ; //文章创建时间
@property (nonatomic,copy)      NSString    *ownerId ; //文章发布者ID
@property (nonatomic,strong)    Pic         *ownerHeadPic ; //文章发布者头像（pic对象）
@property (nonatomic,copy)      NSString    *ownerNickName ; //文章发布者昵称
@property (nonatomic)           long        commentCnt ; //文章评论数
@property (nonatomic)           long        upvoteCnt ; //文章点赞数
@property (nonatomic)           int         isFollow ; //是否已关注文章发布者（0 未关注 1已关注）
@property (nonatomic)           int         isFavorite ; //是否已收藏该文章（0 未收藏 1已收藏）
@property (nonatomic)           int         isUpvote ; //是否已点赞该文章（0 未点赞 1已点赞）



@end
