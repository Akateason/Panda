//
//  UserInfoView.h
//  GroupBuying
//
//  Created by TuTu on 16/8/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class User ;

@interface UserInfoView : UIView
@property (nonatomic,strong) User *aUser ;
@property (nonatomic,copy)  void(^hisFocus)(void) ;
@property (nonatomic,copy)  void(^hisFans)(void) ;
+ (CGFloat)getHeight ;
@end
