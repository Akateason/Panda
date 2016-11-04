//
//  SearchConditionView.h
//  GroupBuying
//
//  Created by TuTu on 16/11/4.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchConditionTableView.h"

@interface SearchConditionView : UIView

- (instancetype)initWithFrame:(CGRect)frame ;

@property (nonatomic,strong) SearchConditionTableView *schTable ;
- (void)showInView:(UIView *)fromView ;
- (void)dismiss ;

@end
