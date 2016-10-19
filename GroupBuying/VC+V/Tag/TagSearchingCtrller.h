//
//  TagSearchingCtrller.h
//  GroupBuying
//
//  Created by teason on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RootCtrl.h"
#import "PublicEnum.h"

@interface TagSearchingCtrller : RootCtrl

@property (nonatomic,copy) NSString *strWillEdit ;
@property (nonatomic,copy) void (^block)(NSString *text) ;

@property (nonatomic) TypeOfTagInformationTextfield tagInfomationType ;

@end
