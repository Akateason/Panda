//
//  FVCKindsCell.m
//  GroupBuying
//
//  Created by teason on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FVCKindsCell.h"
#import "FVCKindCollectionCell.h"
#import "CHTCollectionViewWaterfallLayout.h"


#define kFIND_KINDS_NAME_LIST      @[@"护肤",@"美妆",@"穿搭",@"美食",@"家居"]

@interface FVCKindsCell () <CHTCollectionViewDelegateWaterfallLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UIControl *zoomRanking;
@property (weak, nonatomic) IBOutlet UIControl *zoomHot;

@property (weak, nonatomic) IBOutlet UILabel *lb_rank_1;
@property (weak, nonatomic) IBOutlet UILabel *lb_rank_2;
@property (weak, nonatomic) IBOutlet UILabel *lb_hot_1;
@property (weak, nonatomic) IBOutlet UILabel *lb_hot_2;
@property (weak, nonatomic) IBOutlet UIView *baseline;

@property (nonatomic,strong) CHTCollectionViewWaterfallLayout   *waterflowLayout ;

@end

@implementation FVCKindsCell

- (IBAction)zoomRankingOnClick:(id)sender
{
    NSLog(@"排行榜") ;
    self.blockRank() ;
}

- (IBAction)zoomHotOnClick:(id)sender
{
    NSLog(@"热门产品") ;
    self.blockHotProduct() ;
}


- (CHTCollectionViewWaterfallLayout *)waterflowLayout
{
    if (!_waterflowLayout) {
        _waterflowLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
        _waterflowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _waterflowLayout.headerHeight = 0;
        _waterflowLayout.footerHeight = 0;
        _waterflowLayout.minimumColumnSpacing = 0;
        _waterflowLayout.minimumInteritemSpacing = 0;
        _waterflowLayout.columnCount = 5. ;
    }
    return _waterflowLayout ;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _zoomRanking.backgroundColor = [UIColor xt_tabbarRedColor] ;
    _zoomHot.backgroundColor = [UIColor blackColor] ;
    _lb_hot_1.textColor = [UIColor xt_w_find_ad_white] ;
    _lb_hot_2.textColor = [UIColor xt_w_find_ad_white] ;
    _lb_rank_1.textColor = [UIColor xt_w_find_ad_white] ;
    _lb_rank_2.textColor = [UIColor xt_w_find_ad_white] ;
    _baseline.backgroundColor = [UIColor xt_seperate] ;
    
    [_collectionView registerNib:[UINib nibWithNibName:kID_FVCKindCollectionCell bundle:nil] forCellWithReuseIdentifier:kID_FVCKindCollectionCell] ;
    _collectionView.backgroundColor = [UIColor whiteColor] ;
    _collectionView.dataSource = self ;
    _collectionView.delegate = self ;
    _collectionView.scrollEnabled = false ;
    _collectionView.collectionViewLayout = self.waterflowLayout ;
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

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FVCKindCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID_FVCKindCollectionCell
                                                                            forIndexPath:indexPath] ;
    cell.index = (int)indexPath.row ;
    cell.str = kFIND_KINDS_NAME_LIST[indexPath.row] ;
    return cell ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(APP_WIDTH / 5. , CGHeight(self.frame)) ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}










- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
