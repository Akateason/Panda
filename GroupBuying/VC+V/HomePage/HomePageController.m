//
//  HomePageController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HomePageController.h"
#import "RootCollectionView.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HPProductCollectionCell.h"
#import "HPBigPhotoCollectionCell.h"
#import "HomePageController+collectionLayoutSwitch.h"
#import "HPBigPhotoHeaderView.h"
#import "XLPlainFlowLayout.h"
#import "KxMenu.h"
#import "UIColor+HexString.h"
#import "HomePageController+TitleManager.h"
#import "RankingViewController.h"
#import "CameraNavCtrller.h"
#import "UserInfoCtrller.h"
#import "NoteDetailCtrller.h"

@interface HomePageController () <UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout,RootCollectionViewDelegate,HPBigPhotoHeaderViewDelegate>

// nav
@property (weak, nonatomic) IBOutlet UIButton *itemRanking;
@property (weak, nonatomic) IBOutlet UIButton *itemCamera;
@property (weak, nonatomic) IBOutlet UIButton *itemSwitcher;
// collection view
@property (strong, nonatomic) IBOutlet RootCollectionView *collectionView;
@property (nonatomic,strong) CHTCollectionViewWaterfallLayout *waterflowLayout ;
@property (nonatomic,strong) XLPlainFlowLayout *bplayout ;

@end

@implementation HomePageController


#pragma mark - HPBigPhotoHeaderViewDelegate
- (void)userheadOnClick
{
    UserInfoCtrller *userCtrl = (UserInfoCtrller *)[[self class] getCtrllerFromStory:@"HomePage" controllerIdentifier:@"UserInfoCtrller"] ;
    [userCtrl setHidesBottomBarWhenPushed:YES] ;
    [self.navigationController pushViewController:userCtrl animated:YES] ;
}


#pragma mark - action

- (IBAction)btTitleLogoOnCLick:(UIButton *)sender
{
    // show pop menu .
    CGRect rect = sender.frame ;
    rect.origin.y += sender.frame.size.height / 2. ;
    [KxMenu showMenuInView:self.view.window fromRect:rect menuItems:self.menuItems] ;
    
    // 模拟 [ 有新数据 ]
    [self itemIndex:0 hasNewData:YES] ;
    [self itemIndex:1 hasNewData:YES] ;
    [self itemIndex:2 hasNewData:NO] ;
}

- (void)toAll:(KxMenuItem *)item
{
    NSLog(@"全部") ;
    [self.btTitleLogo setTitle:[self getDisplayStringWithPopItemIndex:0]
                      forState:0] ;
}

- (void)toMyFocus:(KxMenuItem *)item
{
    NSLog(@"我关注的人") ;
    [self.btTitleLogo setTitle:[self getDisplayStringWithPopItemIndex:1]
                      forState:0] ;
}

- (void)toCanBuy:(KxMenuItem *)item
{
    NSLog(@"可购买的") ;
    [self.btTitleLogo setTitle:[self getDisplayStringWithPopItemIndex:2]
                      forState:0] ;
}

- (IBAction)itemRankingOnClick:(id)sender {
    NSLog(@"排行榜") ;
    RankingViewController *rankCtrller = (RankingViewController *)[RankingViewController getCtrllerFromStory:@"HomePage" controllerIdentifier:@"RankingViewController"] ;
    [rankCtrller setHidesBottomBarWhenPushed:YES] ;
    [self.navigationController pushViewController:rankCtrller animated:YES] ;
    
}

- (IBAction)itemCameraOnclick:(id)sender {
    NSLog(@"照相机") ;
    CameraNavCtrller *cNavCtrller = [CameraNavCtrller getNavCtrller] ;
    [cNavCtrller setHidesBottomBarWhenPushed:YES] ;
    [self presentViewController:cNavCtrller animated:YES completion:^{
        
    }] ;
}

- (IBAction)itemSwitcherOnClick:(id)sender {
    NSLog(@"切换视图") ;
    self.itemSwitcher.enabled = false ;
    self.itemSwitcher.selected = !self.itemSwitcher.selected ;
    if (self.itemSwitcher.selected) {
        [self setLayout:self.bplayout collectionView:_collectionView switcher:self.itemSwitcher] ;
    }
    else {
        [self setLayout:self.waterflowLayout collectionView:_collectionView switcher:self.itemSwitcher] ;
    }
    
}

#pragma mark - prop

- (NSArray *)menuItems
{
    if (!_menuItems) {
        _menuItems = @[
                       [KxMenuItem menuItem:@"全部"
                                      image:nil
                                     target:self
                                     action:@selector(toAll:)] ,
                       [KxMenuItem menuItem:@"我关注的人"
                                      image:nil
                                     target:self
                                     action:@selector(toMyFocus:)] ,
                       [KxMenuItem menuItem:@"可购买的"
                                      image:nil
                                     target:self
                                     action:@selector(toCanBuy:)]
                       ] ;
    }
    return _menuItems ;
}

- (RootCollectionView *)collectionView {
    if (!_collectionView)
    {
        _collectionView = [[RootCollectionView alloc] initWithFrame:[self getCollectionRect]
                                               collectionViewLayout:self.waterflowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor xt_collectionBackgroundColor] ;
        _collectionView.showsVerticalScrollIndicator = NO ;
        [_collectionView registerNib:[UINib nibWithNibName:id_HPProductCollectionCell bundle:[NSBundle mainBundle]]
              forCellWithReuseIdentifier:id_HPProductCollectionCell] ;
        [_collectionView registerNib:[UINib nibWithNibName:id_HPBigPhotoCollectionCell bundle:[NSBundle mainBundle]]
          forCellWithReuseIdentifier:id_HPBigPhotoCollectionCell] ;
        [_collectionView registerNib:[UINib nibWithNibName:id_HPBigPhotoHeaderView bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:id_HPBigPhotoHeaderView] ;
    }
    return _collectionView;
}

- (CHTCollectionViewWaterfallLayout *)waterflowLayout
{
    if (!_waterflowLayout) {
        _waterflowLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
        _waterflowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
        _waterflowLayout.headerHeight = 0;
        _waterflowLayout.footerHeight = 0;
        _waterflowLayout.minimumColumnSpacing = 3;
        _waterflowLayout.minimumInteritemSpacing = 3;
    }
    return _waterflowLayout ;
}

- (XLPlainFlowLayout *)bplayout
{
    if (!_bplayout) {
        _bplayout = [[XLPlainFlowLayout alloc] init] ;
        _bplayout.itemSize = CGSizeMake(APP_WIDTH, [HPBigPhotoCollectionCell getSize].height) ;
        _bplayout.sectionInset = UIEdgeInsetsMake(0, 0, 10, 0) ;
    }
    return _bplayout ;
}

#pragma mark - life

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    // nav item position
    [self.view addSubview:self.collectionView];
    // title pop menu .
    [KxMenu setTintColor:[UIColor colorWithHexString:@"555555" alpha:0.5]] ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    [self.navigationController setNavigationBarHidden:YES] ;
    [[UIApplication sharedApplication] setStatusBarHidden:NO] ;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated] ;
    [self.navigationController setNavigationBarHidden:NO] ;
}

- (void)dealloc
{
    _collectionView.delegate = nil ;
    _collectionView.dataSource = nil ;
}


#pragma mark - RootCollectionViewDelegate

- (void)loadNewData
{
    
}

- (void)loadMoreData
{
    
}

#pragma mark - collection dataSourse
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (collectionView.collectionViewLayout == self.bplayout) {
       return 10 ;
    }
    else if (collectionView.collectionViewLayout == self.waterflowLayout) {
       return 1 ;
    }
    return 1 ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.collectionViewLayout == self.bplayout) {
        return 1 ;
    }
    else if (collectionView.collectionViewLayout == self.waterflowLayout) {
        return 10 ;
    }
    return 0 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Set up the reuse identifier
    if (collectionView.collectionViewLayout == self.bplayout) {
        HPBigPhotoCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id_HPBigPhotoCollectionCell forIndexPath:indexPath] ;
        cell.index = indexPath.section ;
        return cell ;

    }
    else if (collectionView.collectionViewLayout == self.waterflowLayout) {
        HPProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id_HPProductCollectionCell forIndexPath:indexPath];
        cell.index = indexPath.row ;
        return cell;
    }
    return nil ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionViewLayout == self.bplayout) {
        return [HPBigPhotoCollectionCell getSize] ;
    }
    if (collectionViewLayout == self.waterflowLayout) {
        return [HPProductCollectionCell getSize] ;
    }
    return CGSizeZero ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (collectionViewLayout == self.bplayout) {
        return CGSizeMake(APP_WIDTH, 70.) ;
    }
    return CGSizeZero ;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil ;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HPBigPhotoHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:id_HPBigPhotoHeaderView forIndexPath:indexPath];
        headerView.index = indexPath.section ;
        headerView.delegate = self ;
        return headerView ;
    }
    return reusableView ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NoteDetailCtrller *detailCtrller = (NoteDetailCtrller *)[[self class] getCtrllerFromStory:@"HomePage" controllerIdentifier:@"NoteDetailCtrller"] ;
    [detailCtrller setHidesBottomBarWhenPushed:YES] ;
    [self.navigationController pushViewController:detailCtrller animated:YES] ;
    
}

#pragma mark - util
- (CGRect)getCollectionRect
{
    CGRect rect = self.view.bounds ;
    rect.size.height -= (APP_TABBAR_HEIGHT + APP_NAVIGATIONBAR_HEIGHT + APP_STATUSBAR_HEIGHT) ;
    rect.origin.y = APP_NAVIGATIONBAR_HEIGHT + APP_STATUSBAR_HEIGHT ;
    
    return rect ;
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    [segue.destinationViewController setHidesBottomBarWhenPushed:YES] ;
}

@end
