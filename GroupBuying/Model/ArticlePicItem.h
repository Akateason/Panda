//
//  ArticlePicItem.h
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Pic ;

@interface ArticlePicItem : NSObject

@property (nonatomic)           NSString    *id_ArticlePicItem ;
@property (nonatomic,strong)    Pic         *img ; //图片(Pic对象)
@property (nonatomic,strong)    NSArray     *items ; //图片中的标签信息(ArticlePicItemInfo对象数组)
@property (nonatomic)           long long   createTime ;


@end
