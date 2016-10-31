//
//  FocusHandler.h
//  GroupBuying
//
//  Created by TuTu on 16/10/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ResultParsered ;

@interface FocusHandler : NSObject

+ (void)configureFocusButtonsTitlesWithButton:(UIButton *)bt ;

+ (void)configureFocusButton:(UIButton *)button IsBothOrNomal:(BOOL)isBoth ;

+ (void)addFocus:(NSString *)createrID
        complete:(void(^)(ResultParsered *result))completion ;

+ (void)cancelFocus:(NSString *)createrID
           complete:(void(^)(ResultParsered *result))completion ;


@end
