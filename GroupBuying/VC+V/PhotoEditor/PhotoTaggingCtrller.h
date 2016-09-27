//
//  PhotoTaggingCtrller.h
//  GroupBuying
//
//  Created by TuTu on 16/9/1.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RootCtrl.h"
#import "PhotoEditorCtrller.h"

@interface PhotoTaggingCtrller : RootCtrl

@property (nonatomic,strong)    UIImage             *image ;
@property (nonatomic,strong)    PhotoEditorCtrller  *editVC ;
@property (nonatomic)           NSInteger           indexInPhotoList ;
@property (nonatomic,strong)    NSArray             *items ;

@end

