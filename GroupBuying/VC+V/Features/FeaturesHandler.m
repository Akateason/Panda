//
//  FeaturesHandler.m
//  GroupBuying
//
//  Created by teason on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FeaturesHandler.h"
#import "RootTableView.h"

@interface FeaturesHandler () <RootTableViewDelegate>

@end

@implementation FeaturesHandler

#pragma mark -
- (BOOL)hasDataSource
{
    return true ;
}

#pragma mark - RootTableViewDelegate
- (void)loadNewData
{
    
}

- (void)loadMoreData
{
   
}


#pragma mark - tableView datasource and delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 0 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return nil ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0. ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) return ;
    NSLog(@"click row : %@",indexPath) ;
    
}


#pragma mark - func

- (void)handleTableDatasourceAndDelegate:(UITableView *)table
{
    if ([table isKindOfClass:[RootTableView class]]) {
        ((RootTableView *)table).xt_Delegate = self ;
    }
    
    [super handleTableDatasourceAndDelegate:table] ;
}



- (void)table:(UITableView *)table IsFromCenter:(BOOL)isFromCenter
{
//    // get banner cell
//    BannerCell *bannerCell = (BannerCell *)[table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] ;
//    // deal with loop timer .
//    if (isFromCenter)
//        [bannerCell start] ;
//    else
//        [bannerCell stop] ;
}


@end
