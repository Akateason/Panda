//
//  TagInfomationViewController.h
//  GroupBuying
//
//  Created by TuTu on 16/10/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicEnum.h"
#import "ArticlePicItemInfo.h"

@class RootCtrl ;

@interface TagInfomationViewController : UIViewController

// will input go to searchTagVC
@property (nonatomic,copy) void(^inputBlock)(NSString *strVal, TypeOfTagInformationTextfield type) ;
// finish
@property (nonatomic,copy) void(^outputBlock)(NSArray *listResultStr, BOOL bAddOrEdit) ;
// cancel
@property (nonatomic,copy) void(^cancelBlock)(void) ;

// show
- (void)showInView:(UIView *)view addOrEdit:(BOOL)addOrEdit ;

// refresh all textfield
- (void)refreshUIsWithArticlePicItemInfo:(ArticlePicItemInfo *)itemInfo ;

// refresh one textfield with type .
- (void)refreshTextFieldWithType:(TypeOfTagInformationTextfield)type
                          string:(NSString *)strText ;

@end
