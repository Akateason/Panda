//
//  Comment+Reply.h
//  GroupBuying
//
//  Created by TuTu on 16/10/27.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "Comment.h"

@interface Comment (Reply)

- (NSMutableAttributedString *)replyDisplayString ;

- (NSString *)makeReplyWithName:(NSString *)name
                        content:(NSString *)strContent ;

- (NSInteger)numberLengthOfReplyName ;

@end
