//
//  RootTableView.h
//  Demo_MjRefresh
//
//  Created by TuTu on 15/12/3.
//  Copyright © 2015年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol RootTableViewDelegate <NSObject>
@optional
- (void)loadNewData ;
- (void)loadMoreData ;
@end

@interface RootTableView : UITableView

@property (nonatomic,weak) id <RootTableViewDelegate> xt_Delegate ; // SET myDelegate TO YOUR CTRLLER
@property (nonatomic) BOOL showRefreshDetail ;      // DEFAULT IS `NO`  -> ONLY GIF IMAGES , SHOW WORDS WHEN IT BECOMES `YES`
@property (nonatomic) BOOL automaticallyLoadMore ;  // DEFAULT IS `NO`  -> MANUALLY LOADING . AUTOMATICALLY LOAD WHEN IT BECOMES `YES`
@property (nonatomic) BOOL automaticallyLoadNew ;   // DEFAULT IS `YES` -> EVERYTIME INITIAL WITH AUTO LOAD NEW . CHANGE IT TO `NO` IF NECESSARY .
- (void)pullDownRefreshHeader ;

- (void)cancelFooterRefreshUI ; // 底部不用刷新

@end
