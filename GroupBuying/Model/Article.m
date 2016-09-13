//
//  Article.m
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "Article.h"
#import "ArticlePicItem.h"

@implementation Article

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"idArticle" : @"id",
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"picItems" : [ArticlePicItem class]
             
             };
}

@end
