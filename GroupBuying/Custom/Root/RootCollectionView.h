//
//  RootCollectionView.h
//  GroupBuying
//
//  Created by TuTu on 16/8/23.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RootCollectionViewDelegate <NSObject>

- (void)loadNewData ;
- (void)loadMoreData ;

@end

@interface RootCollectionView : UICollectionView

@property (nonatomic,weak) id <RootCollectionViewDelegate> xt_delegate ;

@property (nonatomic) BOOL showRefreshDetail ;      // DEFAULT IS `NO`  -> ONLY GIF IMAGES , SHOW WORDS WHEN IT BECOMES `YES`
@property (nonatomic) BOOL automaticallyLoadMore ;  // DEFAULT IS `NO`  -> MANUALLY LOADING . AUTOMATICALLY LOAD WHEN IT BECOMES `YES`
@property (nonatomic) BOOL automaticallyLoadNew ;   // DEFAULT IS `YES` -> EVERYTIME INITIAL WITH AUTO LOAD NEW . CHANGE IT TO `NO` IF NECESSARY .
- (void)pullDownRefreshHeader ;

@end
