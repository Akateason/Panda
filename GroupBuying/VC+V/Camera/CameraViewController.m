//
//  CameraViewController.m
//  GroupBuying
//
//  Created by TuTu on 16/8/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "CameraViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "CHTCollectionViewWaterfallLayout.h"
#import "UIImage+AddFunction.h"
#import "AlbumnCell.h"
#import "AlbumOperation.h"
#import "CameraGoupCtrller.h"

static float kMAX_SELECT_COUNT = 10. ;

@interface CameraViewController () <CHTCollectionViewDelegateWaterfallLayout,UICollectionViewDataSource,UICollectionViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,CameraGroupCtrllerDelegate>
{
    long photoCount ;
}
// Storyboard
@property  (weak, nonatomic) IBOutlet UIBarButtonItem *btCancel;
@property  (weak, nonatomic) IBOutlet UIButton *btTitle;
@property  (weak, nonatomic) IBOutlet UIBarButtonItem *btFinish;
@property  (weak, nonatomic) IBOutlet UIButton *btPreview;
//
@property  (nonatomic, strong) ALAssetsLibrary          *assetsLibrary ;
@property  (nonatomic, strong) NSMutableArray           *imageList ; // data source
@property  (nonatomic, strong) NSMutableArray           *multySelectedImageList ;
@property  (nonatomic, strong) NSMutableArray           *resultImgList ;
@property  (strong, nonatomic) UICollectionView         *collectionView ;
@property  (nonatomic, strong) NSOperationQueue         *operationQueue ;
//
@property  (nonatomic, strong) CameraGoupCtrller        *groupCtrller ;

@end

@implementation CameraViewController

#pragma mark --
#pragma mark - Action
- (IBAction)btCancelOnClick:(id)sender {
    NSLog(@"取消") ;
    if (self.groupCtrller.view.superview) {
        [self.groupCtrller cameraGroupAnimation:!self.groupCtrller.view.superview onView:self.view] ;
    }
    else {
        [self dismissViewControllerAnimated:YES completion:^{
        }] ;
    }
}

- (IBAction)btTitleOnClick:(id)sender {
    NSLog(@"相册") ;
    [self.groupCtrller cameraGroupAnimation:!self.groupCtrller.view.superview onView:self.view] ;
}

- (IBAction)btFinishOnClick:(id)sender {
    NSLog(@"继续") ;
}

- (IBAction)btPreviewOnClick:(id)sender {
    NSLog(@"预览") ;
}

#pragma mark --
#pragma mark - Properties
- (CameraGoupCtrller *)groupCtrller
{
    if (!_groupCtrller) {
        _groupCtrller = [[CameraGoupCtrller alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT - APP_NAVIGATIONBAR_HEIGHT - APP_STATUSBAR_HEIGHT) library:self.assetsLibrary] ;
        _groupCtrller.delegate = self ;
    }
    return _groupCtrller ;
}

- (ALAssetsLibrary *)assetsLibrary
{
    if (!_assetsLibrary) {
        _assetsLibrary = [[ALAssetsLibrary alloc] init] ;
    }
    return _assetsLibrary ;
}

- (NSMutableArray *)imageList
{
    if (!_imageList) {
        _imageList = [@[] mutableCopy] ;
    }
    return _imageList ;
}

- (NSMutableArray *)multySelectedImageList
{
    if (!_multySelectedImageList) {
        _multySelectedImageList = [@[] mutableCopy] ;
    }
    return _multySelectedImageList ;
}

- (NSMutableArray *)resultImgList
{
    _resultImgList = [@[] mutableCopy] ;
    
    for (NSNumber *number in self.multySelectedImageList) {
        ALAsset *asset = (ALAsset *)self.imageList[[number intValue]] ;
        [_resultImgList addObject:asset] ;
    }
    return _resultImgList ;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        // Config layout
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init] ;
        layout.columnCount = kCOLUMN_NUMBER ;
        layout.sectionInset = UIEdgeInsetsMake(kCOLUMN_FLEX, kCOLUMN_FLEX, kCOLUMN_FLEX, kCOLUMN_FLEX) ;
        layout.minimumColumnSpacing = kCOLUMN_FLEX ;
        layout.minimumInteritemSpacing = kCOLUMN_FLEX ;
        
        CGRect rect = self.view.bounds ;
        rect.size.height -= ( 44. + 20. + 44. );
        _collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout] ;
        
        UINib *nib = [UINib nibWithNibName:identifierAlbumnCell bundle:[NSBundle mainBundle]] ;
        [_collectionView registerNib:nib
          forCellWithReuseIdentifier:identifierAlbumnCell] ;
        
        _collectionView.delegate = self ;
        _collectionView.dataSource = self ;
        _collectionView.backgroundColor = [UIColor whiteColor] ;
        if (![_collectionView superview]) {
            [self.view addSubview:_collectionView] ;
        }
    }
    
    return _collectionView ;
}

- (NSOperationQueue *)operationQueue
{
    if (!_operationQueue) {
        _operationQueue = [[NSOperationQueue alloc] init] ;
        _operationQueue.maxConcurrentOperationCount = 15 ;
    }
    return _operationQueue ;
}




#pragma mark --
#pragma mark - Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    photoCount = 0 ;
    [ALAssetsLibrary disableSharedPhotoStreamsSupport]; // 开启 Photo Stream 容易导致 exception
    [_btPreview setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btPreview.layer.borderWidth = 2. ;
    _btPreview.layer.borderColor = [UIColor xt_seperate].CGColor ;
    
    [self collectionView] ;
    [self multySelectedImageList] ;
    [self imageList] ;
    [self getAllPictures] ;
    [self.btTitle setTitle:@"相机胶卷⌵" forState:0] ;
}

#pragma mark --
#pragma mark - Function .
- (void)getAllPictures
{
    // enumerate groups In assetsLibrary way .
    [self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos
                                      usingBlock:^(ALAssetsGroup *group, BOOL *stop)
     {
         [self showImgAssetsInGroup:group] ;
     } failureBlock:^(NSError *error) {
         NSLog(@"Enumerate the asset groups failed.");
         [_collectionView reloadData] ;
     }] ;
}

- (void)showImgAssetsInGroup:(ALAssetsGroup *)group
{
    // sum count in group
    photoCount = [group numberOfAssets] ;
    
    if (!photoCount) [_collectionView reloadData] ;
    
    // enumerate assets
    [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        // get asset
        NSString* assetType = [result valueForProperty:ALAssetPropertyType] ;
        if ([assetType isEqualToString:ALAssetTypePhoto])
        {
            [self.imageList addObject:result] ;
            
            if (photoCount == self.imageList.count) {
                [_collectionView reloadData] ;
                *stop = YES ;
            }
            else if ([self.imageList count] % 30 == 0)
            {
                [_collectionView reloadData] ;
            }
        } ;
    }] ;
}

#pragma mark - Multy Picture selected
- (BOOL)thisPhotoIsSelectedWithRow:(NSInteger)row
{
    __block BOOL bHas = NO ;
    [self.multySelectedImageList enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger idx, BOOL * _Nonnull stop) {
        int selectedRow = [self.multySelectedImageList[idx] intValue] ;
        if (selectedRow == row) {
            bHas = YES ;
            *stop = YES  ;
        }
    }] ;
    return bHas ;
}


#pragma mark --
#pragma mark - collection dataSourse
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1 ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imageList count] + 1 ;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row ;
    AlbumnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierAlbumnCell
                                                                 forIndexPath:indexPath] ;
    cell.bTakePhoto = NO ;
    if (!row) {
        cell.bTakePhoto = YES ;
        return cell ;
    }
    cell.picSelected = [self thisPhotoIsSelectedWithRow:row] ;
    return cell ;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(AlbumnCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row ;
    if (row > 0)
    {
        ALAsset *asset = (ALAsset *)self.imageList[row - 1] ;
        AlbumOperation *operation = [[AlbumOperation alloc] initWithAsset:asset
                                                                indexPath:indexPath
                                                               completion:^(UIImage *resultImage) {
                                                                   cell.img.image = resultImage ;
                                                               }];
        [self.operationQueue addOperation:operation] ;
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [AlbumnCell getSize] ;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row ;
    NSNumber *numRow = [NSNumber numberWithInteger:row] ;
    NSLog(@"ROW : %@",numRow) ;
//    if (!G_TOKEN || !G_USER.u_id)
//    {
//        [NavLogCtller modalLogCtrllerWithCurrentController:self] ;
//        return ;
//    }

    if (!row)
    {
        [self openCamera] ;
        return ;
    }

    if ([self thisPhotoIsSelectedWithRow:row])
    {
        [self.multySelectedImageList removeObject:numRow] ;
    }
    else
    {
        int maxCount = kMAX_SELECT_COUNT - self.existedSubArticleCount ;
        if (self.multySelectedImageList.count >= maxCount)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
//                    [XTHudManager showWordHudWithTitle:WD_HUD_SUB_COUNT_OVERFLOW] ;
                NSLog(@"%d more release",maxCount) ;
            }) ;
            return ;
        }
        [self.multySelectedImageList addObject:numRow] ;
    }
    
//    AlbumnCell *cell = (AlbumnCell *)[self.collectionView cellForItemAtIndexPath:indexPath] ;
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]] ;
//        [self.choosePicBar setCount:self.multySelectedImageList.count] ;
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self cancelNotVisibleOperationsInQueue] ;
}

- (void)cancelNotVisibleOperationsInQueue
{
    NSArray *allOperations = [self.operationQueue operations] ; // operation
    NSArray *visibleIndexPaths = [self.collectionView indexPathsForVisibleItems] ; // indexpaths
    
    NSMutableArray *tempNotVisibleOperations = [@[] mutableCopy] ;
    [allOperations enumerateObjectsUsingBlock:^(AlbumOperation *operation, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![visibleIndexPaths containsObject:operation.indexPath]) {
            [tempNotVisibleOperations addObject:operation] ;
        }
    }] ;
    
    NSArray *NotVisibleOperations = tempNotVisibleOperations ;
    [NotVisibleOperations enumerateObjectsUsingBlock:^(AlbumOperation *operation, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger row = operation.indexPath.row ;
        if (row) [operation cancel] ;
    }] ;
    
}

#pragma mark --
#pragma mark - Open camera
- (void)openCamera
{
    [self startCameraControllerFromViewController:self
                                    usingDelegate:self] ;
}

- (BOOL) startCameraControllerFromViewController:(UIViewController*) controller
                                   usingDelegate:(id <UIImagePickerControllerDelegate,
                                                  UINavigationControllerDelegate>) delegate
{
    // here, check the device is available  or not
    BOOL bFail = ![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] || !delegate || !controller ;
    if (bFail) return NO ;
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init] ;
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera ;
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    //cameraUI.allowsEditing = YES ;
    cameraUI.delegate = delegate ;
    [controller presentViewController:cameraUI
                             animated:YES
                           completion:^{}] ;
    return YES ;
}

#pragma mark --
#pragma mark - imagePickerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *imageFromCamera = [info objectForKey:UIImagePickerControllerOriginalImage] ;
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 [self go2CuttingVC:imageFromCamera] ;
//                                 [CommonFunc saveImageToLibrary:imageFromCamera hud:NO] ;
                             }] ;
}

- (void)go2CuttingVC:(UIImage *)imageResult
{
//    if (self.fetchMode == mode_single)
//    {
//        [self performSegueWithIdentifier:@"camera2Preview" sender:imageResult] ;
//    }
//    else if (self.fetchMode == mode_addSingle)
//    {
//        [self dismissViewControllerAnimated:YES completion:^{
//            [(MultyEditCtrller *)self.orginCtrller changeImageCallback:imageResult] ;
//        }] ;
//    }
}


#pragma mark --
#pragma mark - CameraGroupCtrllerDelegate
- (void)selectAlbumnGroup:(ALAssetsGroup *)group
{
    [self.imageList removeAllObjects] ;
    [self.multySelectedImageList removeAllObjects] ;
    
    photoCount = 0 ;
    [self showImgAssetsInGroup:group] ;
    
    if (self.groupCtrller.view.superview) {
        [self.groupCtrller cameraGroupAnimation:!self.groupCtrller.view.superview onView:self.view] ;
        [self.collectionView reloadData] ;
        [self.btTitle setTitle:[[group valueForProperty:ALAssetsGroupPropertyName] stringByAppendingString:@"⌵"] forState:0] ;
    }
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
