//
//  ArticlePicItem.m
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ArticlePicItem.h"
#import "ArticlePicItemInfo.h"

@implementation ArticlePicItem

- (instancetype)initWillUploadWithPic:(Pic *)pic items:(NSArray *)items
{
    self = [super init];
    if (self) {
        self.img = pic ;
        self.items = items ;
    }
    return self;
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"id_ArticlePicItem" : @"id",
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"items" : [ArticlePicItemInfo class]
             
             };
}





@end
