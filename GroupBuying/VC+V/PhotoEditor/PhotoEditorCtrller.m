//
//  PhotoEditorCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PhotoEditorCtrller.h"
#import "EditorPhotosCollectionCell.h"

@interface PhotoEditorCtrller () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *topBar;
@property (weak, nonatomic) IBOutlet UIButton *btBack;
@property (weak, nonatomic) IBOutlet UIButton *btSave;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UIView *bgMiddle;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width_collection;

@property (weak, nonatomic) IBOutlet UIView *bottomBar;

@end

@implementation PhotoEditorCtrller

#pragma mark - action
- (IBAction)btBackOnClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES] ;
}

- (IBAction)btSaveOnClick:(id)sender
{
    NSLog(@"保存") ;
}


#pragma mark - life
- (void)viewDidLoad
{
    [self.navigationController setNavigationBarHidden:YES] ;
    
    _width_collection.constant = APP_WIDTH ;
    
    _collectionView.pagingEnabled = true ;
    _collectionView.delegate = self ;
    _collectionView.dataSource = self ;
    [_collectionView registerNib:[UINib nibWithNibName:idEditorPhotosCollectionCell bundle:nil] forCellWithReuseIdentifier:idEditorPhotosCollectionCell] ;
    
    
    
    
    [super viewDidLoad];
}



#pragma mark - collection dataSourse
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listPhotos.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EditorPhotosCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:idEditorPhotosCollectionCell forIndexPath:indexPath] ;
    cell.image = self.listPhotos[indexPath.row] ;
    self.labelTitle.text = [NSString stringWithFormat:@"%@ / %@",@(indexPath.row+1),@(self.listPhotos.count)] ;
    return cell ;
}

#pragma mark - collection delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(APP_WIDTH, APP_WIDTH) ;
}


















- (void)didReceiveMemoryWarning
{
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
