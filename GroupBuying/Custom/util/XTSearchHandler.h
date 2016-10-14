//
//  XTSearchHandler.h
//  GroupBuying
//
//  Created by TuTu on 16/10/14.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BlockSearchTaskComplete)(NSURLSessionDataTask *task, id responseObject) ;

@interface XTSearchHandler : NSObject

@property (nonatomic,copy) BlockSearchTaskComplete searchComplete ;
- (void)searchWithText:(NSString *)searchText ;

@end
