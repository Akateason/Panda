//
//  UIColor+AllColors.m
//  XtDemo
//
//  Created by teason on 16/3/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UIColor+AllColors.h"
#import "XTColorFetcher.h"

@implementation UIColor (AllColors)

+ (UIColor *)xt_mainColor
{
    return [[XTColorFetcher class] xt_colorWithKey:@"main"] ;
}

+ (UIColor *)xt_tabbarRedColor
{
    return [[XTColorFetcher class] xt_colorWithKey:@"tabbar_red"] ;
}


@end
