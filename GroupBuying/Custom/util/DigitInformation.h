//
//  DigitInformation.h
//  ParkingSys
//
//  Created by mini1 on 14-4-2.
//  Copyright (c) 2014年 mini1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"


#define DB                          [DigitInformation shareInstance].db


@interface DigitInformation : NSObject

+ (DigitInformation *)shareInstance ;

#pragma mark --
// dataBase
@property (atomic,retain)       FMDatabase      *db;

// UUID
@property (nonatomic,copy)      NSString        *uuid ;

// has weixin or not
@property (nonatomic)           BOOL            appHasInstalledWX ;


@end




