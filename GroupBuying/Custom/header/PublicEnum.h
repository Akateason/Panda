//
//  PublicEnum.h
//  subao
//
//  Created by apple on 15/9/14.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#ifndef subao_PublicEnum_h
#define subao_PublicEnum_h


// 添加图片 . 新增或编辑
typedef NS_ENUM(NSUInteger, CameraViewControllerOpenType) {
    typeDefault , // 多图 . [添加]    点继续,进入cutVC -> editorVC -> PostVC
    typeEdit    , // 多图 . [编辑]    点继续,进入cutVC -> editorVC <- PostVC (popback)
} ;


/**
 category
 用户分类，1为微信，2为微博，3为用户名密码登录
 */
typedef NS_ENUM(NSInteger , MODE_LOGIN_CATE)
{
    mode_WeiXin = 1 ,
    mode_WeiBo  ,
    mode_Local
} ;

#endif
