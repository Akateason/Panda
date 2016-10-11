//
//  NoteDetailCtrller.h
//  GroupBuying
//
//  Created by teason on 16/9/7.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RootCtrl.h"

typedef void(^NDVC_block_focus)(NSString *userID, BOOL bFocus) ;
typedef void(^NDVC_block_upvote)(NSString *noteID, BOOL bUpvote) ;
typedef void(^NDVC_block_favorite)(NSString *noteID, BOOL bFavorite) ;


@interface NoteDetailCtrller : RootCtrl

@property (nonatomic,copy)  NSString            *articleId ;
@property (nonatomic,copy)  NDVC_block_focus    blockFocus ;
@property (nonatomic,copy)  NDVC_block_upvote   blockUpvote ;
@property (nonatomic,copy)  NDVC_block_favorite blockFavorite ;

@end
