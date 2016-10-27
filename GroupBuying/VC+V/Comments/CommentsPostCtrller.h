//
//  CommentsPostCtrller.h
//  GroupBuying
//
//  Created by TuTu on 16/10/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RootCtrl.h"
@class Comment ;

@interface CommentsPostCtrller : RootCtrl

@property (nonatomic,copy) NSString *objectID ; // 文章ID
@property (nonatomic,copy) NSString *strReplyToWho ; // 回复谁 .
@property (nonatomic,copy) void(^blockAddCommentComplete)(Comment *acomment) ; 

@end
