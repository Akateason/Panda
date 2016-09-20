//
//  NoteDetailViewItem.h
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Article , Pic ;

@interface NoteDetailViewItem : NSObject

@property (nonatomic,strong) Article    *articleInfo ; // 文章（Article对象）
@property (nonatomic,copy)   NSString   *ownerId ; //文章发布者ID
@property (nonatomic,strong) Pic        *ownerHeadPic ; //文章发布者头像（pic对象）
@property (nonatomic,copy)   NSString   *ownerNickName ; //文章发布者昵称
@property (nonatomic)        int        isFollow ; //是否已关注文章发布者（0 未关注 1已关注）
@property (nonatomic)        int        isFavorite ; //是否已收藏该文章（0 未收藏 1已收藏）
@property (nonatomic)        int        isUpvote ; //是否已点赞该文章（0 未点赞 1已点赞）
@property (nonatomic,strong) NSArray    *commentList ; //评论列表（Comment对象List）

@end
