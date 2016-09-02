//
//  CuttingViewController.m
//  GroupBuying
//
//  Created by TuTu on 16/9/2.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "CuttingViewController.h"
#import "KICropImageView.h"


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

- (IBAction)btBackOnClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES] ;
}

- (IBAction)btSaveOnClick:(id)sender
{
    // cut next photo or end finish .
    if (self.listPhotos.count - 1 == _indexInCropping) {
        // 1. croping all photos finished .
        
    }
    else {
        // 2. crop next photo .
        UIImage *croppedImage = [self.cropImageView cropImage] ;
        NSMutableArray *tmplist = [self.listPhotos mutableCopy] ;
        [tmplist replaceObjectAtIndex:_indexInCropping withObject:croppedImage] ;
        self.listPhotos = tmplist ;
        
        _indexInCropping ++ ;
    }
    
    NSString *strBtSave = (self.listPhotos.count - 1 == _indexInCropping) ? @"完成" : @"下一张" ;
    [_btSave setTitle:strBtSave forState:0] ;
    _labelTitle.text = [NSString stringWithFormat:@"裁剪%@/%@张图中",@(self.indexInCropping+1),@(self.listPhotos.count)] ;
    [self.cropImageView setImage:self.listPhotos[_indexInCropping]] ;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureUIs] ;
    
    
    CGFloat cropWid = APP_WIDTH - 20. ;
    CGFloat cropHt  = cropWid / 750. * 1004. ;
    CGRect cropRect = CGRectZero ;
    cropRect.origin.x = 10 ;
    cropRect.origin.y = self.topBar.frame.size.height + 10 ;
    cropRect.size.width = cropWid ;
    cropRect.size.height = cropHt ;
    
    _cropImageView = [[KICropImageView alloc] initWithFrame:cropRect] ;
    [_cropImageView setCropSize:CGSizeMake(cropWid, cropHt)] ;
    [_cropImageView setImage:self.listPhotos[0]] ;
    [_cropImageView setUserInterfaced:true] ;
    [self.view addSubview:_cropImageView] ;
    
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
    _labelTitle.text = [NSString stringWithFormat:@"裁剪%@/%@张图中",@(self.indexInCropping+1),@(self.listPhotos.count)] ;
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
