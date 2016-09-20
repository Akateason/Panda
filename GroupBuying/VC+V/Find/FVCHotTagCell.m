//
//  FVCHotTagCell.m
//  GroupBuying
//
//  Created by teason on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FVCHotTagCell.h"
#import "HotTagCollectionCell.h"

@interface FVCHotTagCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UICollectionView *collcectionView;
@property (weak, nonatomic) IBOutlet UIView *baseline;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionHeight;

@end

@implementation FVCHotTagCell


#define kCellWidth      (APP_WIDTH - 15 * 4) / 3.
#define kCellHeight     kCellWidth + 10 + 11 + 10

+ (float)getHeight
{
    return 39. + kCellHeight + 15. ;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _labelTitle.textColor = [UIColor xt_w_comment] ;
    _baseline.backgroundColor = [UIColor xt_seperate] ;
    
    _collcectionView.backgroundColor = [UIColor whiteColor] ;
    _collcectionView.dataSource = self ;
    _collcectionView.delegate = self ;
    _collcectionView.scrollEnabled = false ;
    [_collcectionView registerNib:[UINib nibWithNibName:kID_HotTagCollectionCell bundle:nil]
       forCellWithReuseIdentifier:kID_HotTagCollectionCell] ;
    
    _collectionHeight.constant = kCellHeight ;
}

#pragma mark - collection dataSourse
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1 ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HotTagCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID_HotTagCollectionCell
                                                                            forIndexPath:indexPath] ;
    cell.index = indexPath.row ;
    return cell ;
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake( kCellWidth , kCellHeight) ;
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
