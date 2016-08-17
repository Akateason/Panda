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

@interface HomePageController () <UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>
// nav
@property (weak, nonatomic) IBOutlet UIButton *btTitleLogo;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *itemRanking;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *itemCamera;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *itemSwitcher;
// collection view
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


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
}

#pragma mark - life

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    // nav item position
    self.itemCamera.imageInsets = UIEdgeInsetsMake(0, 0, 0, -22) ;
    
    // collection configure
    [self collectionViewLayoutConfigure] ;
}


- (void)collectionViewLayoutConfigure
{
    //config layout
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.headerHeight = 10;
    layout.footerHeight = 0;
    layout.minimumColumnSpacing = 6;
    layout.minimumInteritemSpacing = 6;
    
    _collectionView.collectionViewLayout = layout ;
    
    _collectionView.delegate = self ;
    _collectionView.dataSource = self ;
//    _collectionView.scrollEnabled = NO ;
//    _collectionView.backgroundColor = COLOR_BACKGROUND ;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
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
    HPProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"HPProductCollectionCell" forIndexPath:indexPath];
    // load the image for this cell
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 374 / 500 = w / h
    float width  = ( APP_WIDTH - 6. ) / 2. ;
    float height = width * 500. / 374. ;
    
    return CGSizeMake(width, height) ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark --
//+ (CGSize)get


@end
