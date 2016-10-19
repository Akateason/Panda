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

static const NSUInteger kTAG_TagInfomation_textfield = 43421 ;

typedef NS_ENUM(NSUInteger, TypeOfTagInformationTextfield) {
    t_brand = kTAG_TagInfomation_textfield ,
    t_name ,
    t_moneyType ,
    t_price ,
    t_coutry ,
    t_location ,
} ;



#endif
