//
//  DetailCommentsCell.h
//  GroupBuying
//
//  Created by teason on 16/9/18.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_DetailCommentsCell = @"DetailCommentsCell" ;

@protocol DetailCommentsCellDelegate <NSObject>
- (void)moreComments ;
@optional
- (void)clickCommentsUserHead:(NSString *)createrID ;
@end


@interface DetailCommentsCell : UITableViewCell
@property (nonatomic,strong) NSArray *comments ;
@property (nonatomic,weak) id <DetailCommentsCellDelegate> delegate ;
+ (CGFloat)calculateHeight:(NSArray *)comments ;
@end
