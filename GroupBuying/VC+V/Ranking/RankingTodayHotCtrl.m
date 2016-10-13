//
//  RankingTodayHotCtrl.m
//  GroupBuying
//
//  Created by TuTu on 16/10/12.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RankingTodayHotCtrl.h"
#import "RootCollectionView.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "RankTodayHotCollectionCell.h"

@interface RankingTodayHotCtrl () <UICollectionViewDelegate,UICollectionViewDataSource,RootCollectionViewDelegate,CHTCollectionViewDelegateWaterfallLayout>

@property (weak, nonatomic) IBOutlet RootCollectionView         *collectionView;
@property (nonatomic,strong) CHTCollectionViewWaterfallLayout   *waterflowLayout ;

@end

@implementation RankingTodayHotCtrl

#pragma -

- (void)scroll2Top
{
    [self.collectionView setContentOffset:CGPointZero animated:YES] ;
}


#pragma - prop

- (CHTCollectionViewWaterfallLayout *)waterflowLayout
{
    if (!_waterflowLayout) {
        _waterflowLayout = [[CHTCollectionViewWaterfallLayout alloc] init] ;
        _waterflowLayout.sectionInset = UIEdgeInsetsMake(5, 0, 0, 0) ;
        _waterflowLayout.headerHeight = 0 ;
        _waterflowLayout.footerHeight = 0 ;
        _waterflowLayout.columnCount = 3 ;
        _waterflowLayout.minimumColumnSpacing = 1 ;
        _waterflowLayout.minimumInteritemSpacing = 1 ;
    }
    return _waterflowLayout ;
}


#pragma - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor blueColor] ;
    
    _collectionView.backgroundColor = [UIColor xt_seperate] ;
    _collectionView.collectionViewLayout = self.waterflowLayout ;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.xt_delegate = self ;
    _collectionView.showsVerticalScrollIndicator = NO ;
    [_collectionView registerNib:[UINib nibWithNibName:kID_RankTodayHotCollectionCell bundle:nil] forCellWithReuseIdentifier:kID_RankTodayHotCollectionCell] ;
}


#pragma mark - reload

- (void)loadNewData
{
    
}

- (void)loadMoreData
{
    
}

#pragma mark - collection dataSourse

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    return self.listNote.count ;
    return 21 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RankTodayHotCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID_RankTodayHotCollectionCell forIndexPath:indexPath] ;
    cell.idxRank = (int)(indexPath.row) ;
    return cell ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [RankTodayHotCollectionCell getSize] ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
