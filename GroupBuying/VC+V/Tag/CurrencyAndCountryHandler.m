//
//  CurrencyAndCountryHandler.m
//  GroupBuying
//
//  Created by TuTu on 16/10/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "CurrencyAndCountryHandler.h"


@implementation CurrencyAndCountryHandler
{
    NSArray *dataSource ;
}

- (NSArray *)dataSource
{
    if (!dataSource) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"CurrencyAndCountry"
                                                              ofType:@"plist"] ;
        dataSource = [[NSArray alloc] initWithContentsOfFile:plistPath] ;
    }
    return dataSource ;
}

- (NSArray *)allCountry
{
    NSMutableArray *tmplist = [@[] mutableCopy] ;
    for (NSDictionary *dic in [self dataSource]) {
        [tmplist addObject:dic[@"c"]] ;
    }
    return tmplist ;
}

- (NSArray *)allCurrency
{
    NSMutableArray *tmplist = [@[] mutableCopy] ;
    for (NSDictionary *dic in [self dataSource]) {
        [tmplist addObject:dic[@"m"]] ;
    }
    return tmplist ;
}

- (NSArray *)schCountry:(NSString *)text
{
    if (!text.length) {
        return [self allCountry] ;
    }
    
    NSMutableArray *tmplist = [@[] mutableCopy] ;
    [[self allCountry] enumerateObjectsUsingBlock:^(NSString *country, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([country containsString:text]) {
            [tmplist addObject:country] ;
        }
    }] ;
    return tmplist ;
}

- (NSArray *)schCurrency:(NSString *)text
{
    if (!text.length) {
        return [self allCurrency] ;
    }
    NSMutableArray *tmplist = [@[] mutableCopy] ;
    [[self allCurrency] enumerateObjectsUsingBlock:^(NSString *currency, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([currency containsString:text]) {
            [tmplist addObject:currency] ;
        }
    }] ;
    return tmplist ;
}


@end
