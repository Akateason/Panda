//
//  FindController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FindController.h"
#import "CuttingViewController.h"
#import "UserOnDevice.h"
#import "FVCBannerCell.h"
#import "FVCKindsCell.h"
#import "FVCHotTagCell.h"
#import "FVCRecommendCell.h"
#import "RankingViewController.h"
#import "HotProductListCtrller.h"

@interface FindController () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *topBar;
@property (weak, nonatomic) IBOutlet UIControl *searchTouchZoom;
@property (weak, nonatomic) IBOutlet UILabel *labelSearchbarText;
@property (weak, nonatomic) IBOutlet RootTableView *table;

@end

@implementation FindController

#pragma mark - action
- (IBAction)searchBarOnClick:(id)sender
{
    NSLog(@"searchbar click , push to search ctrl ") ;
}

#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    [self configureUIs] ;
    
    
    _table.separatorStyle = 0 ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
    
    [_table registerNib:[UINib nibWithNibName:kID_FVCBannerCell bundle:nil] forCellReuseIdentifier:kID_FVCBannerCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_FVCKindsCell bundle:nil] forCellReuseIdentifier:kID_FVCKindsCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_FVCHotTagCell bundle:nil] forCellReuseIdentifier:kID_FVCHotTagCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_FVCRecommendCell bundle:nil] forCellReuseIdentifier:kID_FVCRecommendCell] ;
}

- (void)configureUIs
{
    _labelSearchbarText.textColor = [UIColor xt_w_desc] ;
    _searchTouchZoom.backgroundColor = [UIColor xt_seperate] ;
    _topBar.backgroundColor = [UIColor whiteColor] ;
    _searchTouchZoom.layer.cornerRadius = 3. ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO] ;
    [self.navigationController setNavigationBarHidden:YES] ;
}



#pragma mark - RootTableViewDelegate
- (void)loadNewData
{

    
}

- (void)loadMoreData
{
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4 ;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    if (section == 0) {
        FVCBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_FVCBannerCell] ;
        return cell ;
    }
    else if (section == 1) {
        FVCKindsCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_FVCKindsCell] ;
        cell.blockRank = ^{
            RankingViewController *rankCtrller = (RankingViewController *)[RankingViewController getCtrllerFromStory:@"HomePage" controllerIdentifier:@"RankingViewController"] ;
            [rankCtrller setHidesBottomBarWhenPushed:YES] ;
            [self.navigationController pushViewController:rankCtrller animated:YES] ;
        } ;
        
        cell.blockHotProduct = ^{
            HotProductListCtrller *hotProductVC = (HotProductListCtrller *)[[self class] getCtrllerFromStory:@"Find" controllerIdentifier:@"HotProductListCtrller"] ;
            [hotProductVC setHidesBottomBarWhenPushed:YES] ;
            [self.navigationController pushViewController:hotProductVC animated:YES] ;
        } ;
        return cell ;
    }
    else if (section == 2) {
        FVCHotTagCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_FVCHotTagCell] ;
        return cell ;
    }
    else if (section == 3) {
        FVCRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_FVCRecommendCell] ;
        return cell ;
    }
    
    return nil ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    if (section == 0) {
        return [FVCBannerCell getHeight] ;
    }
    else if (section == 1) {
        return 212. ;
    }
    else if (section == 2) {
        return [FVCHotTagCell getHeight] ;
    }
    else if (section == 3) {
        return [FVCRecommendCell getHeightWithCount:8] ;
    }

    
    return 0 ;
}



@end
