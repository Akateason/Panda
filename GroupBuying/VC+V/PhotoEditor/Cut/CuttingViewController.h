//
//  CuttingViewController.h
//  GroupBuying
//
//  Created by TuTu on 16/9/2.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RootCtrl.h"
#import "PublicEnum.h"

@interface CuttingViewController : RootCtrl

//
@property (nonatomic,strong) NSArray *listPhotos ;

// 打开方式
@property (nonatomic) CameraViewControllerOpenType  openType ;

@end
