//
//  HomePageController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HomePageController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HPProductCollectionCell.h"
#import "HPBigPhotoCollectionCell.h"
#import "HomePageController+collectionLayoutSwitch.h"
#import "HPBigPhotoHeaderView.h"
#import "XLPlainFlowLayout.h"


@interface HomePageController () <UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout,UICollectionViewDelegateFlowLayout>
{
    BOOL  bSwitcher ;   //  itemSwitcher  false -> waterflow , true -> big photo
}

// nav
@property (weak, nonatomic) IBOutlet UIButton        *btTitleLogo;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *itemRanking;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *itemCamera;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *itemSwitcher;
// collection view
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
//
@property (nonatomic,strong) CHTCollectionViewWaterfallLayout *waterflowLayout ;
@property (nonatomic,strong) XLPlainFlowLayout *bplayout ;

@end

@implementation HomePageController

#pragma mark - action

- (IBAction)btTitleLogoOnCLick:(id)sender {
    NSLog(@"标题") ;
}

- (IBAction)itemRankingOnClick:(id)sender {
    NSLog(@"排行榜") ;
}

- (IBAction)itemCameraOnclick:(id)sender {
    NSLog(@"照相机") ;
}

- (IBAction)itemSwitcherOnClick:(id)sender {
    NSLog(@"切换视图") ;
    self.itemSwitcher.enabled = false ;
    bSwitcher = !bSwitcher ;
    self.itemSwitcher.image = bSwitcher ? [UIImage imageNamed:@"btn_square"] : [UIImage imageNamed:@"btn_tile"] ;
    if (bSwitcher) {
        [self setLayout:self.bplayout collectionView:_collectionView switcher:self.itemSwitcher] ;
    }
    else {
        [self setLayout:self.waterflowLayout collectionView:_collectionView switcher:self.itemSwitcher] ;
    }
    
}

#pragma mark - prop

- (UICollectionView *)collectionView {
    if (!_collectionView)
    {
        _collectionView = [[UICollectionView alloc] initWithFrame:[self getCollectionRect]
                                             collectionViewLayout:self.waterflowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor xt_collectionBackgroundColor] ;
        _collectionView.showsVerticalScrollIndicator = NO ;
        [_collectionView registerNib:[UINib nibWithNibName:id_HPProductCollectionCell bundle:nil]
              forCellWithReuseIdentifier:id_HPProductCollectionCell] ;
        [_collectionView registerNib:[UINib nibWithNibName:id_HPBigPhotoCollectionCell bundle:nil]
          forCellWithReuseIdentifier:id_HPBigPhotoCollectionCell] ;
        [_collectionView registerNib:[UINib nibWithNibName:id_HPBigPhotoHeaderView bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:id_HPBigPhotoHeaderView] ;
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
        _bplayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0) ;
    }
    return _bplayout ;
}

#pragma mark - life

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    // nav item position
    self.itemCamera.imageInsets = UIEdgeInsetsMake(0, 0, 0, - 22.) ;
    [self.view addSubview:self.collectionView];
}

- (void)dealloc
{
    _collectionView.delegate = nil ;
    _collectionView.dataSource = nil ;
    
    
}



#pragma mark - collection dataSourse
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (collectionView.collectionViewLayout == self.bplayout) {
       return 5 ;
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
        return 5 ;
    }
    return 0 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Set up the reuse identifier
    if (collectionView.collectionViewLayout == self.bplayout) {
        HPBigPhotoCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id_HPBigPhotoCollectionCell forIndexPath:indexPath] ;
        return cell ;

    }
    else if (collectionView.collectionViewLayout == self.waterflowLayout) {
        HPProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id_HPProductCollectionCell forIndexPath:indexPath];
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
        return headerView ;
    }
    return reusableView ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - util
- (CGRect)getCollectionRect
{
    CGRect rect = self.view.bounds ;
    rect.size.height -= (APP_TABBAR_HEIGHT + APP_NAVIGATIONBAR_HEIGHT + APP_STATUSBAR_HEIGHT);
    return rect ;
}

@end
