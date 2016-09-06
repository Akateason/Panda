//
//  CameraViewController.h
//  GroupBuying
//
//  Created by TuTu on 16/8/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RootCtrl.h"
#import "PostCtrller.h"
#import "PublicEnum.h"


@interface CameraViewController : RootCtrl

// default is 0 , 编辑模式中已经存在的图片数量
@property (nonatomic) int                           existedSubArticleCount ;
// 打开方式
@property (nonatomic) CameraViewControllerOpenType  openType ;
//
@property (nonatomic,strong) PostCtrller            *postCtrl ;

@end
