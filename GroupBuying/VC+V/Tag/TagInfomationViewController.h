//
//  TagInfomationViewController.h
//  GroupBuying
//
//  Created by TuTu on 16/10/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicEnum.h"

@class RootCtrl ;

@interface TagInfomationViewController : UIViewController

@property (nonatomic,copy) void(^inputBlock)(NSString *strVal, TypeOfTagInformationTextfield type) ;

- (void)refreshTextFieldWithType:(TypeOfTagInformationTextfield)type string:(NSString *)strText ;

@end
