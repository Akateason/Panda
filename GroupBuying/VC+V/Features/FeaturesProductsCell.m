//
//  FeaturesProductsCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FeaturesProductsCell.h"
#import "FeaturesPdtCollectionCell.h"

@interface FeaturesProductsCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *topline;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation FeaturesProductsCell

+ (float)getHeight
{
    float height = 15. + APP_WIDTH * 418. / 750. + APP_WIDTH * 31. / 75. ;
    return height ;
}


- (void)setIndex:(int)index
{
    _index = index ;
    
    _imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"introduction%d",index + 1]] ;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    _topline.backgroundColor = [UIColor xt_seperate] ;
    
    _collectionView.scrollEnabled = false ;
    _collectionView.backgroundColor = [UIColor whiteColor] ;
    _collectionView.dataSource = self ;
    _collectionView.delegate = self ;
    [_collectionView registerNib:[UINib nibWithNibName:kID_FeaturesPdtCollectionCell bundle:nil] forCellWithReuseIdentifier:kID_FeaturesPdtCollectionCell] ;
}





#pragma mark - collection dataSourse

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FeaturesPdtCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID_FeaturesPdtCollectionCell forIndexPath:indexPath] ;
    return cell ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select pdt") ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    int wid = APP_WIDTH / 3 ;
    float height =  APP_WIDTH * 31. / 75. ;
    return CGSizeMake(wid ,  height) ;
}









- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
