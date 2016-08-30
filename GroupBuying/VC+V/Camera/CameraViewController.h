//
//  CameraViewController.h
//  GroupBuying
//
//  Created by TuTu on 16/8/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RootCtrl.h"
#import "PostCtrller.h"


typedef NS_ENUM(NSUInteger, CameraViewControllerOpenType) {
    typeDefault , // 多图 . [添加]    点继续,进入postVC
    typeEdit    , // 多图 . [编辑]    点继续,返回postVC
} ;


@interface CameraViewController : RootCtrl

// default is 0 , 编辑模式中已经存在的图片数量
@property (nonatomic) int                           existedSubArticleCount ;
// 打开方式
@property (nonatomic) CameraViewControllerOpenType  openType ;
//
@property (nonatomic,strong) PostCtrller            *postCtrl ;

@end
