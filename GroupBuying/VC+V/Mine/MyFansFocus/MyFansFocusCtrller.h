//
//  MyFansFocusCtrller.h
//  GroupBuying
//
//  Created by TuTu on 16/10/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RootCtrl.h"

typedef NS_ENUM(NSUInteger, DISPLAY_TYPE_MFFVC) {
    type_focus,
    type_fans
};

@interface MyFansFocusCtrller : RootCtrl

@property (nonatomic)       DISPLAY_TYPE_MFFVC displayType ;
@property (nonatomic,copy)  NSString           *userID ;

@end
