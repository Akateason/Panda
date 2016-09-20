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

+ (UIColor *)xt_collectionBackgroundColor
{
    return [[XTColorFetcher class] xt_colorWithKey:@"collection_background"] ;
}

+ (UIColor *)xt_w_dark
{
    return [[XTColorFetcher class] xt_colorWithKey:@"w_dark"] ;
}

+ (UIColor *)xt_w_light
{
    return [[XTColorFetcher class] xt_colorWithKey:@"w_light"] ;
}

+ (UIColor *)xt_seperate
{
    return [[XTColorFetcher class] xt_colorWithKey:@"seperate"] ;
}

+ (UIColor *)xt_w_desc
{
    return [[XTColorFetcher class] xt_colorWithKey:@"w_desc"] ;
}

+ (UIColor *)xt_w_gray
{
    return [[XTColorFetcher class] xt_colorWithKey:@"w_gray"] ;
}

+ (UIColor *)xt_editor_bg
{
    return [[XTColorFetcher class] xt_colorWithKey:@"editor_bg"] ;
}

+ (UIColor *)xt_editor_bar
{
    return [[XTColorFetcher class] xt_colorWithKey:@"editor_bar"] ;
}

+ (UIColor *)xt_editor_w
{
    return [[XTColorFetcher class] xt_colorWithKey:@"editor_w"] ;
}

+ (UIColor *)xt_w_content
{
    return [[XTColorFetcher class] xt_colorWithKey:@"w_content"] ;
}

+ (UIColor *)xt_w_comment
{
    return [[XTColorFetcher class] xt_colorWithKey:@"w_comment"] ;
}

+ (UIColor *)xt_w_find_ad_white
{
    return [[XTColorFetcher class] xt_colorWithKey:@"w_find_ad_white"] ;
}

@end
