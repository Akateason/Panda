//
//  FocusHandler.m
//  GroupBuying
//
//  Created by TuTu on 16/10/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FocusHandler.h"
#import "YYModel.h"
#import "ServerRequest.h"

@implementation FocusHandler

+ (void)configureFocusButtonsTitlesWithButton:(UIButton *)bt
{
    [bt setTitle:@"+ 关注" forState:UIControlStateNormal] ;
    [bt setTitle:@"已关注" forState:UIControlStateSelected] ;
}

+ (void)configureFocusButton:(UIButton *)button
               IsBothOrNomal:(BOOL)isBoth
{
    if (isBoth) {
        [button setTitle:@"互相关注" forState:UIControlStateSelected] ;
    }
    else {
        [button setTitle:@"已关注" forState:UIControlStateSelected] ;
    }
}

+ (void)addFocus:(NSString *)createrID
        complete:(void(^)(ResultParsered *result))completion
{
    [ServerRequest addFollowWithUserID:createrID
                               success:^(id json) {
                                   ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                   if (completion) {
                                       completion(result) ;
                                   }
                               } fail:^{
                                   if (completion) {
                                       completion(nil) ;
                                   }
                               }] ;
}

+ (void)cancelFocus:(NSString *)createrID
           complete:(void(^)(ResultParsered *result))completion
{
    [ServerRequest cancelFollowWithUserID:createrID
                                  success:^(id json) {
                                      
                                      ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                      if (completion) {
                                          completion(result) ;
                                      }
                                  } fail:^{
                                      if (completion) {
                                          completion(nil) ;
                                      }
                                  }] ;
}

@end
