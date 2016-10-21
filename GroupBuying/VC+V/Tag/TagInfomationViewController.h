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

@protocol TagInfomationViewControllerDelegate <NSObject>

// will input go to searchTagVC
- (void)inputTextFieldWithStrVal:(NSString *)strVal type:(TypeOfTagInformationTextfield)type ;
// finish
- (void)outputWithResultStrList:(NSArray *)listResultStr clientID:(int)clientID ;
// cancel
- (void)cancel ;

@end



@interface TagInfomationViewController : UIViewController

@property (nonatomic,weak) id <TagInfomationViewControllerDelegate> delegate ;

// show
- (void)showInView:(UIView *)view
          clientID:(int)clientID ;

// refresh all textfield
- (void)refreshUIsWithArticlePicItemInfo:(ArticlePicItemInfo *)itemInfo ;

// refresh one textfield with type .
- (void)refreshTextFieldWithType:(TypeOfTagInformationTextfield)type
                          string:(NSString *)strText ;

@end
