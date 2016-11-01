//
//  DetailHisFocusCell.m
//  GroupBuying
//
//  Created by teason on 16/9/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DetailHisFocusCell.h"
#import "UserItemCollectionCell.h"
#import "UserFollowViewItem.h"

@interface DetailHisFocusCell () <UICollectionViewDataSource,UICollectionViewDelegate,HPBigPhotoHeaderViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *seperateline;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIButton *btMore;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *baseline;

@end

@implementation DetailHisFocusCell

#pragma mark - prop
- (void)setListFollowers:(NSArray *)listFollowers
{
    _listFollowers = listFollowers ;
    
    if (!listFollowers) return ;
    
    [_collectionView reloadData] ;
    
}


#pragma mark - action
- (IBAction)btMoreOnClick:(id)sender
{
    NSLog(@"more") ;
}

#pragma mark - life
- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _seperateline.backgroundColor = [UIColor xt_seperate] ;
    _labelTitle.textColor = [UIColor xt_w_dark] ;
    [_btMore setTitleColor:[UIColor xt_w_light] forState:0] ;
    _baseline.backgroundColor = [UIColor xt_seperate] ;
    _collectionView.backgroundColor = [UIColor whiteColor] ;
    //
    _collectionView.dataSource = self ;
    _collectionView.delegate = self ;
    [_collectionView registerNib:[UINib nibWithNibName:kID_UserItemCollectionCell bundle:nil] forCellWithReuseIdentifier:kID_UserItemCollectionCell] ;
}


#pragma mark - collection dataSourse

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listFollowers.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UserItemCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID_UserItemCollectionCell forIndexPath:indexPath] ;
    cell.followItem = self.listFollowers[indexPath.row] ;
    cell.delegate = self ;
    return cell ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select tag") ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(70,118) ;
}


#pragma mark -
- (void)userheadOnClickWithUserID:(NSString *)userID userName:(NSString *)name
{
    [self.delegate userheadOnClickWithUserID:userID userName:name] ;
}

- (BOOL)followUserBtOnClickWithCreaterID:(NSString *)createrID followed:(BOOL)bFollow
{
    return [self.delegate followUserBtOnClickWithCreaterID:createrID followed:bFollow] ;
}







- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
