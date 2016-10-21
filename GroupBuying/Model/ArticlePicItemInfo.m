//
//  ArticlePicItemInfo.m
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ArticlePicItemInfo.h"
#import "NSString+Extend.h"


@implementation ArticlePicItemInfo

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"id_ArticlePicItemInfo" : @"id",
             };
}

- (BOOL)leftOrRight
{
    if ([self.posType isEqualToString:@"RIGHT"]) {
        return false ;
    }
    return true ;
}

- (void)changeLeftAndRight
{
    if ([self.posType isEqualToString:@"RIGHT"]) {
        self.posType = @"LEFT" ;
    }
    else {
        self.posType = @"RIGHT" ;
    }
}




- (NSArray *)tagGroup
{
    NSMutableArray *tmplist = [@[] mutableCopy] ;
    if (self.brand.length > 0 || self.sku.length > 0) {
        NSString *strRes = [NSString stringWithFormat:@"%@ %@",self.brand,self.sku] ;
        [tmplist addObject:[strRes strMinusSpaceInPrefixAndTail]] ;
    }
    if (self.currency.length > 0 || self.price > 0) {
        NSString *strRes = [NSString stringWithFormat:@"%.1lf %@",self.price,self.currency] ;
        [tmplist addObject:[strRes strMinusSpaceInPrefixAndTail]] ;
    }
    if (self.nation.length > 0 || self.location.length > 0) {
        NSString *strRes = [NSString stringWithFormat:@"%@ %@",self.nation,self.location] ;
        [tmplist addObject:[strRes strMinusSpaceInPrefixAndTail]] ;
    }
    
    return tmplist ;
}





@end
