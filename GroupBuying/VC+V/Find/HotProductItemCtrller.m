//
//  HotProductItemCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HotProductItemCtrller.h"
#import "RootCollectionView.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "TDCProductCollectionCell.h"

@interface HotProductItemCtrller () <UICollectionViewDelegate,UICollectionViewDataSource,RootCollectionViewDelegate,CHTCollectionViewDelegateWaterfallLayout>

@property (weak, nonatomic) IBOutlet RootCollectionView         *collectionView;
@property (nonatomic,strong) CHTCollectionViewWaterfallLayout   *waterflowLayout ;

@end

@implementation HotProductItemCtrller

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



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _collectionView.collectionViewLayout = self.waterflowLayout ;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.xt_delegate = self ;
    _collectionView.backgroundColor = [UIColor xt_collectionBackgroundColor] ;
    _collectionView.showsVerticalScrollIndicator = NO ;
    [_collectionView registerNib:[UINib nibWithNibName:kID_TDCProductCollectionCell bundle:nil] forCellWithReuseIdentifier:kID_TDCProductCollectionCell] ;
}


#pragma mark - reload

- (void)loadNewData
{
    
}

- (void)loadMoreData
{
    
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
    TDCProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID_TDCProductCollectionCell forIndexPath:indexPath] ;
    return cell ;

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
