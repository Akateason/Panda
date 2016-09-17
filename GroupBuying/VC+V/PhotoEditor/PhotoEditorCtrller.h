//
//  PhotoEditorCtrller.h
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RootCtrl.h"
#import "PublicEnum.h"

@interface PhotoEditorCtrller : RootCtrl

@property (nonatomic,strong) NSArray *listPhotos ; // UIimage list
@property (nonatomic,strong) NSArray *listTagItems ; // 若图片无tag,用NSNull占位.

// 打开方式
@property (nonatomic) CameraViewControllerOpenType  openType ;


@end
