//
//  PhotoTagView.h
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoTagView : UIView

@property (nonatomic)       BOOL        boolDirection ; // false -> right or true -> left .
@property (nonatomic,copy)  NSString    *strDisplay ;
@property (nonatomic)       CGPoint     ptInStage ;

- (instancetype)initWithStrDisplay:(NSString *)strDisplay
                         ptInStage:(CGPoint)ptInStage
                         direction:(BOOL)bDirection
                          backView:(UIView *)backView ;

@end
