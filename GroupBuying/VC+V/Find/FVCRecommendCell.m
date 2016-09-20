//
//  FVCRecommendCell.m
//  GroupBuying
//
//  Created by teason on 16/9/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FVCRecommendCell.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HPProductCollectionCell.h"

@interface FVCRecommendCell () <UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong) CHTCollectionViewWaterfallLayout *waterflowLayout ;

@end

@implementation FVCRecommendCell

+ (float)getHeightWithCount:(NSInteger)count
{
    return 10 + count / 2 * ([HPProductCollectionCell getSize].height + 3.) ;
}

#pragma mark - prop
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

#pragma mark - life
- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    _collectionView.backgroundColor = [UIColor whiteColor] ;
    _collectionView.scrollEnabled = false ;
    _collectionView.collectionViewLayout = self.waterflowLayout ;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerNib:[UINib nibWithNibName:id_HPProductCollectionCell bundle:[NSBundle mainBundle]]
      forCellWithReuseIdentifier:id_HPProductCollectionCell] ;

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
    HPProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id_HPProductCollectionCell forIndexPath:indexPath];
    cell.index = indexPath.row ;
    //    cell.noteItem = self.listNote[indexPath.row] ;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [HPProductCollectionCell getSize] ;
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






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
