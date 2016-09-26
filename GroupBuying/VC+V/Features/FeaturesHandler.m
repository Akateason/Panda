//
//  FeaturesHandler.m
//  GroupBuying
//
//  Created by teason on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FeaturesHandler.h"
#import "RootTableView.h"
#import "FeaturesProductsCell.h"
#import "FVCBannerCell.h"
#import "FeaturesRecommendCell.h"

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
    return 3 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 )
    {
        return 1 ; // banner
    }
    else if (section == 1)
    {
        return 2 ; // feature product .
    }
    else if (section == 2)
    {
        return 1 ; // feature recommend
    }
    
    return 0 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    if (section == 0 )
    {
        FVCBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_FVCBannerCell] ;
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:kID_FVCBannerCell bundle:nil] forCellReuseIdentifier:kID_FVCBannerCell] ;
            cell = [tableView dequeueReusableCellWithIdentifier:kID_FVCBannerCell] ;
        }
        return cell ;
    }
    else if (section == 1)
    {
        FeaturesProductsCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_FeaturesProductsCell] ;
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:kID_FeaturesProductsCell bundle:nil] forCellReuseIdentifier:kID_FeaturesProductsCell] ;
            cell = [tableView dequeueReusableCellWithIdentifier:kID_FeaturesProductsCell] ;
        }
        cell.index = indexPath.row ;
        return cell ;
    }
    else if (section == 2)
    {
        FeaturesRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_FeaturesRecommendCell] ;
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:kID_FeaturesRecommendCell bundle:nil] forCellReuseIdentifier:kID_FeaturesRecommendCell] ;
            cell = [tableView dequeueReusableCellWithIdentifier:kID_FeaturesRecommendCell] ;
        }
        return cell ;
    }

    return nil ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    if (section == 0 )
    {
        return [FVCBannerCell getHeight] ;
    }
    else if (section == 1)
    {
        return [FeaturesProductsCell getHeight] ;
    }
    else if (section == 2)
    {
        return [FeaturesRecommendCell getHeightWithCount:8] ;
    }
    
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
