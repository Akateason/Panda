//
//  MineEditAddCtrller.h
//  GroupBuying
//
//  Created by TuTu on 16/9/27.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RootCtrl.h"

typedef enum : NSUInteger {
    type_textField_words, // default
    type_textField_number,
    type_textview ,
    type_gender_choose ,
    type_birth_choose
} EditAddCellType ;

typedef void(^BringValStringBack)(NSString *str) ;


@interface MineEditAddCtrller : RootCtrl

@property (nonatomic,copy) NSString           *strTitle ;
@property (nonatomic,copy) NSString           *strVal ;
@property (nonatomic)      EditAddCellType    displayType ;
@property (nonatomic,copy) BringValStringBack blockValString ;

@end
