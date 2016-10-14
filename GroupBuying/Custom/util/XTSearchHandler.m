//
//  XTSearchHandler.m
//  GroupBuying
//
//  Created by TuTu on 16/10/14.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "XTSearchHandler.h"
#import "AFNetworking.h"
#import "ServerRequest.h"

@interface XTSearchHandler ()

@property (nonatomic,strong) NSMutableArray *arrayOfTasks ;
@property (nonatomic,strong) AFHTTPSessionManager *manager ;

@end

@implementation XTSearchHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [[AFHTTPSessionManager alloc] init] ;
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer] ;
        self.arrayOfTasks = [NSMutableArray new] ;
    }
    return self;
}


- (void)searchWithText:(NSString *)searchText
{
    if (searchText.length >= 2)
    {
        /// cancel all previous tasks
        [self.arrayOfTasks enumerateObjectsUsingBlock:^(NSURLSessionDataTask *taskObj, NSUInteger idx, BOOL *stop) {
            [taskObj cancel] ; /// when sending cancel to the task failure: block is going to be called
        }];
        
        /// empty the arraOfTasks
        [self.arrayOfTasks removeAllObjects];
        
        /// init new task
        NSURLSessionDataTask *task = [ServerRequest searchArticleTagWithSearchKey:searchText
                                                                          manager:self.manager
                                                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                                                              
                                                                              self.searchComplete(task,responseObject) ;
                                                                              
                                                                          } fail:^(NSURLSessionDataTask *task, NSError *error) {
                                                                              
                                                                          }] ;
        
        /// add the task to our arrayOfTasks
        [self.arrayOfTasks addObject:task] ;
    }
}

@end
