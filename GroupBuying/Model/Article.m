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


- (instancetype)initArticleWillPostWithTitle:(NSString *)title
                                    picItems:(NSArray *)picItems
                                     content:(NSString *)content
                                        type:(NSString *)type
                                        tags:(NSArray *)tags
                                      status:(NSString *)status
{
    self = [super init];
    if (self) {
        self.title = title ;
        self.picItems = picItems ;
        self.content = content ;
        self.type = type ;
        self.tags = tags ;
        self.status = status ;
    }
    return self;
}



@end
