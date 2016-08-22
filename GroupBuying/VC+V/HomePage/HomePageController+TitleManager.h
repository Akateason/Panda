//
//  HomePageController+TitleManager.h
//  GroupBuying
//
//  Created by TuTu on 16/8/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HomePageController.h"

@interface HomePageController (TitleManager)

// 设置是否有新数据
- (void)itemIndex:(NSInteger)indexPopItem hasNewData:(BOOL)hasNewData ;

// 标题显示什么
- (NSString *)getDisplayStringWithPopItemIndex:(NSInteger)index ;

@end
