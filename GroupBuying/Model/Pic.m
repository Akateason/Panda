//
//  Pic.m
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "Pic.h"
#import "Resource.h"

@implementation Pic

- (instancetype)initWithResource:(Resource *)resource
{
    self = [super init];
    if (self) {
        self.resourceId = resource.idResource ;
        self.nativeUrl = resource.url ;
        self.qiniuUrl = resource.qiniuUrl ;
    }
    return self;
}

@end
