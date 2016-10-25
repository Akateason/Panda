//
//  PhotoEditorCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PhotoEditorCtrller.h"
#import "EditorPhotosCollectionCell.h"
#import "PhotoTaggingCtrller.h"
#import "SVProgressHUD.h"
#import "PostCtrller.h"
#import "EditFilterSampleController.h"
#import "UIImage+AddFunction.h"

@interface PhotoEditorCtrller () <UICollectionViewDelegate,UICollectionViewDataSource,TuSDKPFEditFilterControllerDelegate>
{
    int page ;
}
// storyboard
@property (weak, nonatomic) IBOutlet UIView *topBar;
@property (weak, nonatomic) IBOutlet UIButton *btBack;
@property (weak, nonatomic) IBOutlet UIButton *btSave;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIView *bgMiddle;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *bottomBar;
@property (weak, nonatomic) IBOutlet UIButton *btEditPhoto;
@property (weak, nonatomic) IBOutlet UIButton *btTagging;

//
@property (nonatomic,strong) UIImage *photoEditedThumbNail ;
@property (nonatomic,strong) UIImage *photoEditedOrigin ;

@end

@implementation PhotoEditorCtrller

#pragma mark - func
- (void)moveToIdx:(int)idx
{
    CGFloat pageWith = APP_WIDTH - 20. ;
    self.collectionView.contentOffset = CGPointMake(pageWith * idx, 0) ;
}

- (void)refreshCollectionView
{
    [_collectionView reloadData] ;
}

#pragma mark - action
- (IBAction)btBackOnClick:(id)sender
{
    if (self.openType == typeDefault) {
        [self dismissViewControllerAnimated:YES completion:nil] ;
    }
    else if (self.openType == typeAddAgain || self.openType == typeEdit) {
        [self.navigationController popViewControllerAnimated:YES] ;
    }
}

- (IBAction)btSaveOnClick:(id)sender
{
    NSLog(@"保存") ;
    if (self.openType == typeDefault) {
        [self performSegueWithIdentifier:@"editor2Post" sender:nil] ;
    }
    else if (self.openType == typeAddAgain) {
        for (id VC  in self.navigationController.viewControllers)
        {
            if ([VC isKindOfClass:[PostCtrller class]])
            {
                PostCtrller *postCtrl = (PostCtrller *)VC ;
                NSMutableArray *tmpList = [postCtrl.photoList mutableCopy] ;
                [tmpList addObjectsFromArray:self.listPhotos] ;
                postCtrl.photoList = tmpList ;
                [self.navigationController popToViewController:postCtrl animated:YES] ;
                break ;
            }
        }
    }
    else if (self.openType == typeEdit) {
        for (id VC  in self.navigationController.viewControllers)
        {
            if ([VC isKindOfClass:[PostCtrller class]])
            {
                PostCtrller *postCtrl = (PostCtrller *)VC ;
                postCtrl.photoList = self.listPhotos ;
                [self.navigationController popToViewController:postCtrl animated:YES] ;
                break ;
            }
        }
    }
}

- (IBAction)btTaggingOnClick:(id)sender
{
    NSLog(@"标签") ;
    [self performSegueWithIdentifier:@"editor2tagging"
                              sender:self.listPhotos[page]] ;
}

- (IBAction)btEditPhotoOnClick:(id)sender
{
    NSLog(@"编辑") ;
    EditFilterSampleController *filterVC = [[EditFilterSampleController alloc] init] ;
    filterVC.inputImage = [self.listPhotos[page] copy] ;
    filterVC.delegate = self ;
    [self.navigationController pushViewController:filterVC animated:NO] ;
}


#pragma mark - TuSDKPFEditFilterControllerDelegate <TuSDKCPComponentErrorDelegate>
/**
 *  图片编辑完成
 *
 *  @param controller 图片编辑滤镜控制器
 *  @param result 处理结果
 */
- (void)onTuSDKPFEditFilter:(TuSDKPFEditFilterController *)controller result:(TuSDKResult *)result
{
    UIImage *completeOriginalImage = [result loadResultImage] ;
    self.photoEditedOrigin = completeOriginalImage ;
    self.photoEditedThumbNail = [UIImage thumbnailWithImage:completeOriginalImage size:CGSizeMake(100, 100)] ;    
}

/**
 *  获取组件返回错误信息
 *
 *  @param controller 控制器
 *  @param result     返回结果
 *  @param error      异常信息
 */
- (void)onComponent:(TuSDKCPViewController *)controller result:(TuSDKResult *)result error:(NSError *)error
{
    NSLog(@"error : %@",error) ;
}





#pragma mark - prop

- (void)setPhotoEditedOrigin:(UIImage *)photoEditedOrigin
{
    _photoEditedOrigin = photoEditedOrigin ;
    
    if (photoEditedOrigin != NULL)
    {
        NSMutableArray *tmpList = [self.listPhotos mutableCopy] ;
        [tmpList replaceObjectAtIndex:page
                           withObject:photoEditedOrigin] ;
        self.listPhotos = tmpList ;
        [self.collectionView reloadData] ;
    }
}


- (NSArray *)listTagItems
{
    if (!_listTagItems) {
        NSMutableArray *tmpList = [@[] mutableCopy] ;
        for (int i = 0; i < self.listPhotos.count; i++) {
            [tmpList addObject:[NSNull null]] ;
        }
        _listTagItems = tmpList ;
    }
    return _listTagItems ;
}






#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureCollectionView] ;
    [self configureUIs] ;
}

- (void)configureCollectionView
{
    _collectionView.pagingEnabled = true ;
    _collectionView.delegate = self ;
    _collectionView.dataSource = self ;
    [_collectionView registerNib:[UINib nibWithNibName:idEditorPhotosCollectionCell bundle:nil]
      forCellWithReuseIdentifier:idEditorPhotosCollectionCell] ;
    _collectionView.backgroundColor = [UIColor xt_editor_bg] ;
}

- (void)configureUIs
{
    _topBar.backgroundColor = [UIColor xt_editor_bar] ;
    _bgMiddle.backgroundColor = [UIColor xt_editor_bg] ;
    _bottomBar.backgroundColor = [UIColor xt_editor_bar] ;
    [_btBack setTitleColor:[UIColor xt_editor_w] forState:0] ;
    [_btSave setTitleColor:[UIColor xt_editor_w] forState:0] ;
    [_btEditPhoto setTitleColor:[UIColor xt_editor_w] forState:0] ;
    [_btTagging setTitleColor:[UIColor xt_editor_w] forState:0] ;
    _labelTitle.textColor = [UIColor xt_editor_w] ;
    self.labelTitle.text = [NSString stringWithFormat:@"%@ / %@",@(1),@(self.listPhotos.count)] ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES] ;
    [self.navigationController setNavigationBarHidden:YES] ;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated] ;
    
    if (self.moveToIdx > 0) {
        [self moveToIdx:self.moveToIdx] ;
    }
}


#pragma mark - collection dataSourse
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listPhotos.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EditorPhotosCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:idEditorPhotosCollectionCell
                                                                                 forIndexPath:indexPath] ;
    cell.image = self.listPhotos[indexPath.row] ;
    return cell ;
}


#pragma mark - collection delegate
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(APP_WIDTH - 20., self.bgMiddle.frame.size.height - 20. ) ;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWith = APP_WIDTH - 20. ;
    page = floor((scrollView.contentOffset.x - pageWith / 2) / pageWith) + 1 ;
    self.labelTitle.text = [NSString stringWithFormat:@"%@ / %@",@(page + 1),@(self.listPhotos.count)] ;
}
















- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"editor2tagging"])
    {
        PhotoTaggingCtrller *tagCtrl = segue.destinationViewController ;
        tagCtrl.editVC = self ;
        tagCtrl.indexInPhotoList = page ;
        tagCtrl.items = self.listTagItems[page] ;
        tagCtrl.image = sender ;
    }
    else if ([segue.identifier isEqualToString:@"editor2Post"])
    {
        PostCtrller *postCtrl = [segue destinationViewController] ;
        postCtrl.photoList = self.listPhotos ;
        postCtrl.photoTagList = self.listTagItems ;
    }
}


@end
