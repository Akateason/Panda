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
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
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
    
    bSwitcher = !bSwitcher ;
    
    self.itemSwitcher.image = bSwitcher ? [UIImage imageNamed:@"btn_square"] : [UIImage imageNamed:@"btn_tile"] ;
    
    if (bSwitcher) {
        [_collectionView setCollectionViewLayout:self.bigphotoLayout animated:YES] ;
    }
    else {
        [_collectionView setCollectionViewLayout:self.waterflowLayout animated:YES] ;
    }
    
//    _collectionView.collectionViewLayout = bSwitcher ? self.bigphotoLayout : self.waterflowLayout ;
//    _collectionView.collectionViewLayout = bSwitcher ? nil : self.waterflowLayout ;
    
//    [_collectionView reloadData] ;
}

#pragma mark - prop

- (CHTCollectionViewWaterfallLayout *)waterflowLayout
{
    if (!_waterflowLayout) {
        _waterflowLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
        _waterflowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _waterflowLayout.headerHeight = 10;
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
        _bigphotoLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _bigphotoLayout.headerHeight = 10;
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
    
    // collection configure
    [self collectionViewLayoutConfigure] ;
}


- (void)collectionViewLayoutConfigure
{
    //config layout
    self.collectionView.collectionViewLayout = self.waterflowLayout ;
    
    self.collectionView.delegate = self ;
    self.collectionView.dataSource = self ;
    self.collectionView.backgroundColor = [UIColor xt_collectionBackgroundColor] ;
    self.collectionView.showsVerticalScrollIndicator = NO ;
//    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth ;
    
    [self.collectionView registerClass:[HPProductCollectionCell class] forCellWithReuseIdentifier:id_HPProductCollectionCell] ;
    [self.collectionView registerClass:[HPBigPhotoCollectionCell] forCellWithReuseIdentifier:id_HPBigPhotoCollectionCell] ;
}



#pragma mark - collection dataSourse
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1 ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2 ;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Set up the reuse identifier
    if (bSwitcher) {
        HPBigPhotoCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id_HPBigPhotoCollectionCell forIndexPath:indexPath] ;
        return cell ;
    }
    else {
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
//    return bSwitcher ?  : [HPProductCollectionCell getSize] ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - util


@end
