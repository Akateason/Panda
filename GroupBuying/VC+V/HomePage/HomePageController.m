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
@property (nonatomic,strong) CHTCollectionViewWaterfallLayout *bigphotoLayout ;

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
        [self setLayout:self.bigphotoLayout collectionView:_collectionView switcher:self.itemSwitcher] ;
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
//        _collectionView.decelerationRate = 0 ;
        [_collectionView registerNib:[UINib nibWithNibName:id_HPProductCollectionCell bundle:nil]
              forCellWithReuseIdentifier:id_HPProductCollectionCell] ;
        [_collectionView registerNib:[UINib nibWithNibName:id_HPBigPhotoCollectionCell bundle:nil]
          forCellWithReuseIdentifier:id_HPBigPhotoCollectionCell] ;
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

- (CHTCollectionViewWaterfallLayout *)bigphotoLayout
{
    if (!_bigphotoLayout) {
        _bigphotoLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
        _bigphotoLayout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
        _bigphotoLayout.headerHeight = 0;
        _bigphotoLayout.footerHeight = 0;
        _bigphotoLayout.columnCount = 1 ;
        _bigphotoLayout.minimumColumnSpacing = 10;
        _bigphotoLayout.minimumInteritemSpacing = 10;
    }
    return _bigphotoLayout ;
}

#pragma mark - life

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    // nav item position
    self.itemCamera.imageInsets = UIEdgeInsetsMake(0, 0, 0, - 22.) ;
    [self.view addSubview:self.collectionView];
}

- (void)dealloc {
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
}



#pragma mark - collection dataSourse
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1 ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5 ;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Set up the reuse identifier
    
    if (collectionView.collectionViewLayout == self.bigphotoLayout) {
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
    if (collectionViewLayout == self.bigphotoLayout) {
        return [HPBigPhotoCollectionCell getSize] ;
    }
    if (collectionViewLayout == self.waterflowLayout) {
        return [HPProductCollectionCell getSize] ;
    }
    return CGSizeZero ;
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
