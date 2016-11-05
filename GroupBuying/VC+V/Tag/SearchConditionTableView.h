//
//  SearchConditionTableView.h
//  GroupBuying
//
//  Created by TuTu on 16/11/4.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchConditionTableView : UITableView

@property (nonatomic,copy) void(^changedCondition)(int index, NSString *title) ; // search condition Value Changed .
@property (nonatomic,copy) void(^dismiss)(void) ; 

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style ;

- (void)makeIndexBeChoosen:(int)index ;

- (void)setListConditions:(NSArray *)listConditions ;

- (int)resultSelectedIndex ;

@end
