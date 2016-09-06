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

@property (nonatomic,strong) NSArray *listPhotos ;
// 打开方式
@property (nonatomic) CameraViewControllerOpenType  openType ;


@end
