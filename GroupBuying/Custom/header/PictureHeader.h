//
//  PictureHeader.h
//  SuBaoJiang
//
//  Created by apple on 15/7/13.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#ifndef SuBaoJiang_PictureHeader_h
#define SuBaoJiang_PictureHeader_h

// Global Images
#define IMG_NOPIC               [UIImage imageNamed:@"nopic"]
#define IMG_HEAD_NO             [UIImage imageNamed:@"t_h_5"]
#define IMG_PHONE_WID(STR,W)    [STR stringByAppendingString:[NSString stringWithFormat:@"?imageView/2/w/%@",@(W)]]

// Qiniu url
extern NSString *const URL_QINIU_HEAD ;

#endif
