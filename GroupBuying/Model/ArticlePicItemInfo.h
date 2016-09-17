//
//  ArticlePicItemInfo.h
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//  发布信息图片标签



#import <Foundation/Foundation.h>

@interface ArticlePicItemInfo : NSObject

@property (nonatomic,copy)  NSString    *id_ArticlePicItemInfo ;

@property (nonatomic,copy)  NSString    *type ; //文章图片信息类型(产地，品牌，价格，型号) 允许值: "LOCATION", "BRAND", "PRICE", "SKU"
@property (nonatomic,copy)  NSString    *text ; //文字内容
@property (nonatomic)       float       posX ;
@property (nonatomic)       float       posY ;
@property (nonatomic,copy)  NSString    *posType ; //位置方向(左，右) 允许值: "LEFT", "RIGHT"

@property (nonatomic,copy)  NSString    *articleId ; //所属文章ID
@property (nonatomic,copy)  NSString    *articlePicItemId ; //所属文章图片ID
@property (nonatomic)       long long   createTime ;


@end
