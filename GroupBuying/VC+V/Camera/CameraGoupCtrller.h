//
//  CameraGoupCtrller.h
//  GroupBuying
//
//  Created by TuTu on 16/8/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ALAssetsLibrary ;
@class ALAssetsGroup ;

@protocol CameraGroupCtrllerDelegate <NSObject>
- (void)selectAlbumnGroup:(ALAssetsGroup *)group ;
@end

@interface CameraGoupCtrller : UIViewController

@property (nonatomic, weak)  id <CameraGroupCtrllerDelegate> delegate ;
@property (nonatomic,strong) ALAssetsLibrary *assetsLibrary ;

- (instancetype)initWithFrame:(CGRect)frame ;

@end
