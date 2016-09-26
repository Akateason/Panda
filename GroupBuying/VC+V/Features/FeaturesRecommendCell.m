//
//  FeaturesRecommendCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FeaturesRecommendCell.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "TDCProductCollectionCell.h"

@interface FeaturesRecommendCell () <UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>

@property (weak, nonatomic) IBOutlet UIView *topline;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong) CHTCollectionViewWaterfallLayout *waterflowLayout ;

@end

@implementation FeaturesRecommendCell

#pragma mark -
+ (float)getHeightWithCount:(NSInteger)count
{
    return 15. + count / 2 * ([TDCProductCollectionCell getSize].height + 3.) ;
}

#pragma mark - life
- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _topline.backgroundColor        = [UIColor xt_seperate] ;
    _collectionView.backgroundColor = [UIColor xt_seperate] ;
    _collectionView.scrollEnabled = false ;
    _collectionView.collectionViewLayout = self.waterflowLayout ;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerNib:[UINib nibWithNibName:kID_TDCProductCollectionCell bundle:[NSBundle mainBundle]]
      forCellWithReuseIdentifier:kID_TDCProductCollectionCell] ;

}



#pragma mark - prop
- (CHTCollectionViewWaterfallLayout *)waterflowLayout
{
    if (!_waterflowLayout) {
        _waterflowLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
        _waterflowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _waterflowLayout.headerHeight = 0;
        _waterflowLayout.footerHeight = 0;
        _waterflowLayout.minimumColumnSpacing = 3;
        _waterflowLayout.minimumInteritemSpacing = 3;
    }
    return _waterflowLayout ;
}


#pragma mark - collection dataSourse
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1 ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    return self.listNote.count ;
    return 8 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TDCProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID_TDCProductCollectionCell forIndexPath:indexPath];
    //    cell.noteItem = self.listNote[indexPath.row] ;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [TDCProductCollectionCell getSize] ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    NoteDetailCtrller *detailCtrller = (NoteDetailCtrller *)[[self class] getCtrllerFromStory:@"HomePage" controllerIdentifier:@"NoteDetailCtrller"] ;
    //    NSString *articleIDWillSend = nil ;
    //    if (collectionView.collectionViewLayout == self.bplayout) {
    //        NoteListViewItem *note = self.listNote[indexPath.section] ;
    //        articleIDWillSend = note.articleId ;
    //    }
    //    else if (collectionView.collectionViewLayout == self.waterflowLayout) {
    //        NoteListViewItem *note = self.listNote[indexPath.row] ;
    //        articleIDWillSend = note.articleId ;
    //    }
    //    detailCtrller.articleId = articleIDWillSend ;
    //    [detailCtrller setHidesBottomBarWhenPushed:YES] ;
    //    [self.navigationController pushViewController:detailCtrller animated:YES] ;
}











- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
