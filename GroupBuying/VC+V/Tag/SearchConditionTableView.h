//
//  SearchConditionTableView.h
//  GroupBuying
//
//  Created by TuTu on 16/11/4.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchConditionTableView : UITableView

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style ;

- (void)makeIndexBeChoosen:(int)index ;

- (void)setListConditions:(NSArray *)listConditions ;

- (int)resultSelectedIndex ;

@end
