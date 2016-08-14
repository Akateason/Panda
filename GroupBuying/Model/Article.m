//
//  Article.m
//  SuBaoJiang
//
//  Created by apple on 15/6/5.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#import "Article.h"
#import "ArticleComment.h"
#import "ArticlePraise.h"
#import "User.h"
#import "DigitInformation.h"
#import "XTTickConvert.h"
#import "UIImage+AddFunction.h"
#import <CoreText/CoreText.h>
#import "XTFileManager.h"


@interface Article ()
@property (nonatomic,strong) NSDictionary *labelAttrStyle ;
@end

@implementation Article

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"userCurrent" : @"" ,
             @"a_id" : @"a_id",
             @"img" : @"img",
             @"a_content" : @"a_content",
             @"a_updatetime" : @"a_updatetime",
             @"a_createtime" : @"a_createtime",
             @"articleCommentList" : @"article_comments",
             @"article_comments_count" : @"article_comments_count",
             @"has_praised" : @"has_praised" ,
             @"is_author" : @"is_author" ,
             @"praiseList" : @"article_praise" ,
             @"a_title" : @"a_title" ,
             @"ac_content" : @"ac_content" ,
             @"childList" : @"child_items"
             } ;
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"articleCommentList" : [ArticleComment class],
             @"praiseList" : [ArticlePraise class],
             @"childList" : [Article class]
             } ;
}

@end
