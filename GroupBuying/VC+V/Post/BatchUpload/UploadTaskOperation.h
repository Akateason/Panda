//
//  UploadTaskOperation.h
//  GroupBuying
//
//  Created by teason on 16/9/16.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UploadTaskOperation : NSOperation

+ (instancetype)operationWithURLSessionTask:(NSURLSessionTask*)task ;

@end
