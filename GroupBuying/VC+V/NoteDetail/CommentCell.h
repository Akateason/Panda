//
//  CommentCell.h
//  GroupBuying
//
//  Created by TuTu on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Comment ;

static NSString *const kID_CommentCell = @"CommentCell" ;

@interface CommentCell : UITableViewCell
@property (nonatomic,strong) Comment *aComment ;
@property (nonatomic,copy) void(^blockTapHead)(NSString *createrID) ;
@property (nonatomic,copy) void(^blockReply)(NSString *replyToWho) ;
+ (CGFloat)calculateHeight:(Comment *)comment ;
@end
