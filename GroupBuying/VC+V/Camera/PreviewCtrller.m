//
//  PreviewCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PreviewCtrller.h"
#import "PreviewCollectionCell.h"

@interface PreviewCtrller () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;

@end

@implementation PreviewCtrller



- (void)setPhotosList:(NSArray *)photosList
{
    _photosList = photosList ;
    
    [_collectionview reloadData] ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _collectionview.pagingEnabled = YES ;
    _collectionview.dataSource = self ;
    _collectionview.delegate = self ;
    [_collectionview registerClass:[PreviewCollectionCell class] forCellWithReuseIdentifier:idPreviewCollectionCell] ;
}



#pragma mark - collection dataSourse
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1 ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photosList.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Set up the reuse identifier
    PreviewCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:idPreviewCollectionCell forIndexPath:indexPath] ;
    if (!cell) {
        cell = [[PreviewCollectionCell alloc] initWithFrame:self.view.frame] ;
    }
    [cell resetStyle] ;
    cell.image = self.photosList[indexPath.row] ;
    self.title = [NSString stringWithFormat:@"%@ / %@",@(indexPath.row+1) , @(self.photosList.count)] ;
    
    return cell ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size ;
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
