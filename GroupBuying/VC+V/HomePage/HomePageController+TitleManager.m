//
//  HomePageController+TitleManager.m
//  GroupBuying
//
//  Created by TuTu on 16/8/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HomePageController+TitleManager.h"
#import "KxMenu.h"


@implementation HomePageController (TitleManager)

static NSString *kStrHasNewData1 = @"\t\t●" ;
static NSString *kStrHasNewData2 = @"\t●" ;
static NSString * kStrAppTitle = @"盼达网⌵" ;
static NSString * kStrArrow = @"⌵" ;



// 标题显示什么
- (NSString *)getDisplayStringWithPopItemIndex:(NSInteger)index
{
    if (index == 0) {
        self.btTitleLogo.titleLabel.font = [UIFont systemFontOfSize:19.] ;
        return kStrAppTitle ;
    }
    else {
        self.btTitleLogo.titleLabel.font = [UIFont systemFontOfSize:16.] ;
        NSString *titleStr = ((KxMenuItem *)self.menuItems[index]).title ;
        if ([titleStr containsString:kStrHasNewData1]) {
            titleStr = [titleStr stringByReplacingOccurrencesOfString:kStrHasNewData1 withString:@""] ;
        }
        if ([titleStr containsString:kStrHasNewData2]) {
            titleStr = [titleStr stringByReplacingOccurrencesOfString:kStrHasNewData2 withString:@""] ;
        }
        
        titleStr = [titleStr stringByAppendingString:kStrArrow] ;
        return titleStr ;
    }
}

// 设置是否有新数据
- (void)itemIndex:(NSInteger)indexPopItem hasNewData:(BOOL)hasNewData
{
    KxMenuItem *item = self.menuItems[indexPopItem] ;
    
    if (indexPopItem == 0) {
        [self item:item
        hasNewData:hasNewData
         appendStr:kStrHasNewData1] ;
    }
    else {
        [self item:item
        hasNewData:hasNewData
         appendStr:kStrHasNewData2] ;
    }        
}

#pragma mark - private

- (void)item:(KxMenuItem *)item
  hasNewData:(BOOL)hasNewData
   appendStr:(NSString *)appendStr
{
    if (hasNewData) {
        if ([item.title containsString:appendStr]) return ;
        
        item.title = [item.title stringByAppendingString:appendStr] ;
    }
    else {
        item.title = [item.title stringByReplacingOccurrencesOfString:appendStr withString:@""] ;
    }
}



@end
