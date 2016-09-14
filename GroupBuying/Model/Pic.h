//
//  Pic.h
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Resource ;

@interface Pic : NSObject

@property (nonatomic,copy)  NSString    *resourceId ;
@property (nonatomic,copy)  NSString    *nativeUrl ;
@property (nonatomic,copy)  NSString    *qiniuUrl ;

- (instancetype)initWithResource:(Resource *)resource ;

@end
