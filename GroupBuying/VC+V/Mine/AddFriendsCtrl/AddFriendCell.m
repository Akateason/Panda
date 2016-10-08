//
//  AddFriendCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/27.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "AddFriendCell.h"
#import "AddFriendCollectionCell.h"


@interface AddFriendCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *topbar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userHead;
@property (weak, nonatomic) IBOutlet UILabel *userPositionLabel;
@property (weak, nonatomic) IBOutlet UIButton *btFocus;
@property (weak, nonatomic) IBOutlet UIButton *btHidden;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *bottomBar;

@end

@implementation AddFriendCell

#pragma mark - public
+ (float)getHeight
{
    float collectionHeight = APP_WIDTH * 21. / 64. ;
    return 60. + collectionHeight + 20 ;
}

#pragma mark - action
- (IBAction)btFocusOnClick:(id)sender
{
    NSLog(@"btfoucus") ;
}

- (IBAction)btHiddenOnClick:(id)sender
{
    NSLog(@"bthidden") ;
}

#pragma mark - life
- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _topbar.backgroundColor = [UIColor whiteColor] ;
    _userHead.layer.cornerRadius = _userHead.frame.size.width / 2. ;
    _nameLabel.textColor = [UIColor xt_w_dark] ;
    _userPositionLabel.textColor = [UIColor xt_w_gray] ;
    [_btFocus setTitleColor:[UIColor xt_w_dark] forState:0] ;
    [_btHidden setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btFocus.layer.borderWidth = 1. ;
    _btFocus.layer.borderColor = [UIColor xt_w_dark].CGColor ;
    _btHidden.layer.borderWidth = 1. ;
    _btHidden.layer.borderColor = [UIColor xt_w_gray].CGColor ;
    _btFocus.backgroundColor = [UIColor whiteColor] ;
    _btHidden.backgroundColor = [UIColor whiteColor] ;
    _bottomBar.backgroundColor = [UIColor xt_seperate] ;
    
    _collectionView.backgroundColor = [UIColor whiteColor] ;
    _collectionView.dataSource = self ;
    _collectionView.delegate = self ;
    _collectionView.scrollEnabled = false ;
    [_collectionView registerNib:[UINib nibWithNibName:kID_AddFriendCollectionCell bundle:nil] forCellWithReuseIdentifier:kID_AddFriendCollectionCell] ;
}






#pragma mark - collection dataSourse
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AddFriendCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID_AddFriendCollectionCell forIndexPath:indexPath] ;
    return cell ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float length = (APP_WIDTH - 6.) / 3. ;
    return CGSizeMake(length, length) ;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
