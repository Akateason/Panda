//
//  NSString+Extend.m
//  SuBaoJiang
//
//  Created by apple on 15/7/17.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#import "NSString+Extend.h"

@implementation NSString (Extend)

- (NSString *)strMinusSpaceInPrefixAndTail
{
    if ([self hasPrefix:@" "]) {
        return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] ;
    }
    return self ;
}


- (NSString *)minusSpaceStr
{
    NSCharacterSet *whitespaces = [NSCharacterSet whitespaceCharacterSet] ;
    NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"] ;
    
    NSArray *parts = [self componentsSeparatedByCharactersInSet:whitespaces] ;
    NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings] ;
    
    return [filteredArray componentsJoinedByString:@" "] ;
}

- (NSString *)minusReturnStr
{
    NSString *content = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] ;
    content = [content stringByReplacingOccurrencesOfString:@"\r" withString:@""] ;
    content = [content stringByReplacingOccurrencesOfString:@"\n" withString:@""] ;

    return content ;
}


- (CGSize)calculateWithOverSize:(CGSize)overSize
                 systemFontSize:(CGFloat)fontNumber
{
    UIFont *font = [UIFont systemFontOfSize:fontNumber] ;
    CGSize labelSize = [self boundingRectWithSize:overSize
                                          options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                       attributes:@{NSFontAttributeName:font}
                                          context:nil].size ;
    return labelSize ;
}

- (NSString *)URLEncodedString
{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    return encodedString;
}

@end
