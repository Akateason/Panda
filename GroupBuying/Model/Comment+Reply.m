//
//  Comment+Reply.m
//  GroupBuying
//
//  Created by TuTu on 16/10/27.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "Comment+Reply.h"

static NSString *const kReplySymbol = @"_IBARDOT_REPLY_" ;

@implementation Comment (Reply)

- (BOOL)contentIsReply
{
    return [self.content containsString:kReplySymbol] ;
}

- (NSMutableAttributedString *)replyDisplayString
{
    NSArray *strlist = [self.content componentsSeparatedByString:kReplySymbol] ;
    if ([self contentIsReply]) {
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"@%@ %@",[strlist firstObject],[strlist lastObject]]] ;
        [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor xt_tabbarRedColor] range:NSMakeRange(0, [[strlist firstObject] length] + 1)] ;
        [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor xt_w_comment] range:NSMakeRange([[strlist firstObject] length] + 2, [[strlist lastObject] length])] ;
        return attrStr ;
    }
    else {
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.content] ;
        [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor xt_w_comment] range:NSMakeRange(0, [self.content length])] ;
        return attrStr ;
    }
}

- (NSString *)makeReplyWithName:(NSString *)name content:(NSString *)strContent
{
    return [NSString stringWithFormat:@"%@%@%@",name,kReplySymbol,strContent] ;
}

- (NSInteger)numberLengthOfReplyName
{
    if ([self contentIsReply]) {
        return self.createrName.length + 1 ;
    }
    return 0 ;
}

@end
