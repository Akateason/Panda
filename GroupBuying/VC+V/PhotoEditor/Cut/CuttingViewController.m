//
//  CuttingViewController.m
//  GroupBuying
//
//  Created by TuTu on 16/9/2.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "CuttingViewController.h"
#import "KICropImageView.h"
#import "PhotoEditorCtrller.h"


#define cropWid         (APP_WIDTH - 20.)
#define cropHt          (cropWid / 750. * 1004.)

@interface CuttingViewController ()

// Storyboard
@property (weak, nonatomic) IBOutlet UIView *topBar;
@property (weak, nonatomic) IBOutlet UIButton *btBack;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIButton *btSave;
// code
@property (nonatomic,strong) KICropImageView *cropImageView;
@property (nonatomic)   int indexInCropping ; // start from 0 .

@end

@implementation CuttingViewController

#pragma mark - action
- (IBAction)btBackOnClick:(id)sender
{
//    [self.navigationController popViewControllerAnimated:YES] ;
    [self dismissViewControllerAnimated:YES completion:nil] ;
}

- (IBAction)btSaveOnClick:(id)sender
{
    // cut next photo or end finish .
    if (self.listPhotos.count - 1 == _indexInCropping) {
        // 1. croping all photos finished .
        // push to editor .
        [self cutFinished] ;
        return ;
    }
    else {
        // 2. crop next photo .
        [self cutNextPhoto] ;
    }
    
    //
    [self displayUIs] ;
}

#pragma mark - 
- (void)cutNextPhoto
{
    UIImage *croppedImage = [self.cropImageView cropImage] ;
    NSMutableArray *tmplist = [self.listPhotos mutableCopy] ;
    [tmplist replaceObjectAtIndex:_indexInCropping withObject:croppedImage] ;
    self.listPhotos = [NSArray arrayWithArray:tmplist] ;
    
    _indexInCropping ++ ;
}

- (void)displayUIs
{
    NSString *strBtSave = (self.listPhotos.count - 1 == _indexInCropping) ? @"完成" : @"下一张" ;
    [_btSave setTitle:strBtSave forState:0] ;
    _labelTitle.text = [NSString stringWithFormat:@"裁剪%@/%@张图中",@(self.indexInCropping+1),@(self.listPhotos.count)] ;
    
    //
    [self.cropImageView removeFromSuperview] ;
    _cropImageView = nil ;
    [self cropImageView] ;
    
}

- (void)cutFinished
{
    [self cutNextPhoto] ;
    [self performSegueWithIdentifier:@"cut2editor" sender:self.listPhotos] ;
}


#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureUIs] ;
    [self cropImageView] ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES] ;
    [self.navigationController setNavigationBarHidden:YES] ;
}

- (void)configureUIs
{
    _topBar.backgroundColor = [UIColor xt_editor_bar] ;
    [_btBack setTitleColor:[UIColor xt_editor_w] forState:0] ;
    [_btSave setTitleColor:[UIColor xt_editor_w] forState:0] ;
    _labelTitle.textColor = [UIColor xt_editor_w] ;
    NSString *strBtSave = (self.listPhotos.count - 1 == _indexInCropping) ? @"完成" : @"下一张" ;
    [_btSave setTitle:strBtSave forState:0] ;
    _labelTitle.text = [NSString stringWithFormat:@"裁剪%@/%@张图",@(self.indexInCropping+1),@(self.listPhotos.count)] ;
    self.view.backgroundColor = [UIColor xt_editor_bg] ;
}

#pragma mark - prop
- (KICropImageView *)cropImageView
{
    if (!_cropImageView) {
        CGRect maskRect = CGRectZero ;
        maskRect.origin.x = 10 ;
        maskRect.origin.y = self.topBar.frame.size.height + 10 ;
        maskRect.size.width = cropWid ;
        maskRect.size.height = APP_HEIGHT - self.topBar.frame.size.height - 20 ; ;
        
        _cropImageView = [[KICropImageView alloc] init] ;
        _cropImageView.backgroundColor = [UIColor xt_editor_bg] ;
        [_cropImageView setFrame:maskRect] ;                        // mask rect size .
        [_cropImageView setImage:self.listPhotos[_indexInCropping]] ;
        [_cropImageView setCropSize:CGSizeMake(cropWid, cropHt)] ;  // crop size .
        if (!_cropImageView.superview) {
            [self.view addSubview:self.cropImageView] ;

        }
    }
    return _cropImageView ;
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"cut2editor"])
    {
        PhotoEditorCtrller *editorCtrl = [segue destinationViewController] ;
        editorCtrl.listPhotos = sender ;
    }
}


@end
