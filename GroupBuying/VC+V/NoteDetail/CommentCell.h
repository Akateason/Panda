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

+ (CGFloat)calculateHeight:(Comment *)comment ;

@end
