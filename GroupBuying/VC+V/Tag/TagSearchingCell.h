//
//  TagSearchingCell.h
//  GroupBuying
//
//  Created by teason on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TypeOfTagCell) {
    typeDefaultDisplay,                 //   默认显示搜索结果
    typeConfirmAddTag                   //   点击添加 xxx
};


static NSString *idTagSearchingCell = @"TagSearchingCell" ;

@interface TagSearchingCell : UITableViewCell

@property (nonatomic)       TypeOfTagCell           cellType ;
@property (nonatomic,copy)  NSString                *strDisplay ;

@end
