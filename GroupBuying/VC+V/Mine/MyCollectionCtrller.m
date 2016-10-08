//
//  MyCollectionCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/10/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyCollectionCtrller.h"
#import "RootCollectionView.h"
#import "XTSegment.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HPProductCollectionCell.h"
#import "TDCProductCollectionCell.h"

typedef NS_ENUM(int, MCVC_CollectionCellDisplayType) {
    status_note,
    status_product
};


@interface MyCollectionCtrller () <UICollectionViewDataSource,UICollectionViewDelegate,RootCollectionViewDelegate,XTSegmentDelegate,CHTCollectionViewDelegateWaterfallLayout>

@property (weak, nonatomic) IBOutlet RootCollectionView *collectionView;
@property (nonatomic,strong) XTSegment *segment ;
@property (nonatomic,strong) CHTCollectionViewWaterfallLayout *waterflowLayout ;
@property (nonatomic)        MCVC_CollectionCellDisplayType type_CellDisplay ;
@end

@implementation MyCollectionCtrller

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

- (XTSegment *)segment
{
    if (!_segment) {
        _segment = [[XTSegment alloc] initWithDataList:@[@"笔记收藏",@"产品收藏"]
                                                 imgBg:[UIImage imageNamed:@"btBase"]
                                                height:45.
                                           normalColor:[UIColor xt_w_light]
                                           selectColor:[UIColor xt_tabbarRedColor]
                                                  font:[UIFont systemFontOfSize:14.]
                                                 frame:APPFRAME] ;
        _segment.backgroundColor = [UIColor whiteColor] ;
        _segment.delegate = self ;
        _segment.frame = CGRectMake(0, 0, APP_WIDTH, 45.) ;
        if (!_segment.superview) {
            [self.view addSubview:_segment] ;
        }
    }
    return _segment ;
}

#pragma mark - XTSegmentDelegate
- (void)clickSegmentWith:(int)index
{
    NSLog(@"index : %d",index) ;
    
    self.type_CellDisplay = index ;
    
    [_collectionView reloadData] ;

}


#pragma mark - life

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"我的收藏" ;
    [self segment] ;
    
    _collectionView.backgroundColor = [UIColor whiteColor] ;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.xt_delegate = self ;
    _collectionView.collectionViewLayout = self.waterflowLayout ;
    [_collectionView registerNib:[UINib nibWithNibName:id_HPProductCollectionCell bundle:[NSBundle mainBundle]]
      forCellWithReuseIdentifier:id_HPProductCollectionCell] ;
    [_collectionView registerNib:[UINib nibWithNibName:kID_TDCProductCollectionCell bundle:nil] forCellWithReuseIdentifier:kID_TDCProductCollectionCell] ;
}






#pragma mark - RootCollectionViewDelegate

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
    return 10 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.type_CellDisplay == status_note) {
        HPProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id_HPProductCollectionCell forIndexPath:indexPath];
        cell.index = indexPath.row ;
        //    cell.noteItem = self.listNote[indexPath.row] ;
        return cell;
    }
    else if (self.type_CellDisplay == status_product) {
        TDCProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID_TDCProductCollectionCell forIndexPath:indexPath] ;
        return cell ;
    }
    return nil ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [HPProductCollectionCell getSize] ;
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
