//
//  NSTimer+Addition.h
//  XTLoopScroll
//
//  Created by TuTu on 15/11/2.
//  Copyright © 2015年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)

//关闭定时器
- (void)pauseTimer;
//启动定时器
- (void)resumeTimer;
//添加一个定时器
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
