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
#import <PhotoEditFramework/PhotoEditFramework.h>
#import "SVProgressHUD.h"
#import "PostCtrller.h"

@interface PhotoEditorCtrller () <UICollectionViewDelegate,UICollectionViewDataSource,pg_edit_sdk_controller_delegate>

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
@property (nonatomic) int currentIndex ;
@property (nonatomic,strong) UIImage *photoEditedThumbNail ;
@property (nonatomic,strong) UIImage *photoEditedOrigin ;

@end

@implementation PhotoEditorCtrller

#pragma mark - action
- (IBAction)btBackOnClick:(id)sender
{
    
    if (self.openType == typeDefault) {
        [self dismissViewControllerAnimated:YES completion:nil] ;
    }
    else if (self.openType == typeEdit) {
        [self.navigationController popViewControllerAnimated:YES] ;
    }
}

- (IBAction)btSaveOnClick:(id)sender
{
    NSLog(@"保存") ;
    if (self.openType == typeDefault) {
        [self performSegueWithIdentifier:@"editor2Post" sender:self.listPhotos] ;
    }
    else if (self.openType == typeEdit) {
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
}

- (IBAction)btTaggingOnClick:(id)sender
{
    NSLog(@"标签") ;
    [self performSegueWithIdentifier:@"editor2tagging"
                              sender:self.listPhotos[self.currentIndex - 1]] ;
}

- (IBAction)btEditPhotoOnClick:(id)sender
{
    NSLog(@"编辑") ;
    
    pg_edit_sdk_controller *editCtl = nil;
    {
        //构建编辑对象    Construct edit target
        pg_edit_sdk_controller_object *obje = [[pg_edit_sdk_controller_object alloc] init];
        {
            //输入原图  Input original
            obje.pCSA_fullImage = [self.listPhotos[self.currentIndex - 1] copy];
        }
        editCtl = [[pg_edit_sdk_controller alloc] initWithEditObject:obje withDelegate:self];
    }
    NSAssert(editCtl, @"Error");
    if (editCtl) {
        [self.navigationController pushViewController:editCtl animated:YES];
    }

}

#pragma mark - pg_edit_sdk_controller_delegate
- (void)dgPhotoEditingViewControllerDidCancel:(UIViewController *)pController withClickSaveButton:(BOOL)isClickSaveBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dgPhotoEditingViewControllerDidFinish:(UIViewController *)pController
                                       object:(pg_edit_sdk_controller_object *)pOjbect
{
    //获取效果小图    Obtain effect thumbnail
    self.photoEditedThumbNail = [UIImage imageWithData:pOjbect.pOutEffectDisplayData] ;
    
    //获取效果大图    Obtain effect large image
    self.photoEditedOrigin = [UIImage imageWithData:pOjbect.pOutEffectOriData] ;
//    NSAssert(imageOri, @" ");
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dgPhotoEditingViewControllerShowLoadingView:(UIView *)view
{
    [SVProgressHUD show] ;
}

- (void)dgPhotoEditingViewControllerHideLoadingView:(UIView *)view
{
    [SVProgressHUD dismiss] ;
}



#pragma mark - prop
- (void)setCurrentIndex:(int)currentIndex
{
    _currentIndex = currentIndex ;
    
    self.labelTitle.text = [NSString stringWithFormat:@"%@ / %@",@(currentIndex),@(self.listPhotos.count)] ;
}

- (void)setPhotoEditedOrigin:(UIImage *)photoEditedOrigin
{
    _photoEditedOrigin = photoEditedOrigin ;
    
    if (photoEditedOrigin != NULL)
    {
        NSMutableArray *tmpList = [self.listPhotos mutableCopy] ;
        [tmpList replaceObjectAtIndex:self.currentIndex - 1
                           withObject:photoEditedOrigin] ;
        self.listPhotos = tmpList ;
        [self.collectionView reloadData] ;
    }
}


#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureUIs] ;
    
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
    self.currentIndex = 1 ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES] ;
    [self.navigationController setNavigationBarHidden:YES] ;
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
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(APP_WIDTH - 20., self.bgMiddle.frame.size.height - 20. ) ;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWith = APP_WIDTH - 20. ;
    int page = floor((scrollView.contentOffset.x - pageWith / 2) / pageWith) + 1 ;
    self.currentIndex = page + 1 ;
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
    if ([segue.identifier isEqualToString:@"editor2tagging"]) {
        PhotoTaggingCtrller *tagCtrl = segue.destinationViewController ;
        tagCtrl.image = sender ;
    }
    else if ([segue.identifier isEqualToString:@"editor2Post"]) {
        PostCtrller *postCtrl = [segue destinationViewController] ;
        postCtrl.photoList = sender ;
    }
}


@end
