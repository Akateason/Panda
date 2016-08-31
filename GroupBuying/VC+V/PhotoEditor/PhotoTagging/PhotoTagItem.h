//
//  PhotoTagItem.h
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoTagItem : NSObject

@property (nonatomic,copy,nonnull)  NSString *strDisplay ;
@property (nonatomic)               BOOL     bDirection ;
@property (nonatomic)               CGPoint  ptRate ;
@property (nonatomic)               CGPoint  ptInStage ;

@end
