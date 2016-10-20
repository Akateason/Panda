//
//  PhotoTaggingCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/1.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PhotoTaggingCtrller.h"
//#import "YXLTagEditorImageView.h"
#import "ArticlePicItemInfo.h"
#import "YYModel.h"
#import "TagInfomationViewController.h"
#import "TagSearchingCtrller.h"
#import "MaxShapeView.h"
#import "MaxLightingView.h"

@interface PhotoTaggingCtrller ()<UIGestureRecognizerDelegate>

// story board
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *btback;
@property (weak, nonatomic) IBOutlet UIButton *btSave;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
// code
//@property (nonatomic,strong)YXLTagEditorImageView *tagEditorImageView;
@property (nonatomic,strong)UILabel               *labelTips ;
@property (nonatomic,strong)UIImageView           *imageViewBG ;
@property (nonatomic,strong)TagInfomationViewController *taginfoVC ;
@property (nonatomic,strong)NSMutableArray        *listMShapeViews ;

@end

@implementation PhotoTaggingCtrller


#pragma mark - action
- (IBAction)btBackOnClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES] ;
}

// 确定并pop
// 返回这个图片所有的标签地址内容，是否翻转样式的数组   坐标为这个图片的真实坐标
- (IBAction)btSaveOnClick:(id)sender
{
    
    
    
//    NSMutableArray *dicList = [self.tagEditorImageView popTagModel] ;
//    NSMutableArray *tagItemInfoList = [@[] mutableCopy] ;
//    for (NSDictionary *dic in dicList)
//    {
//        ArticlePicItemInfo *itemInfo = [ArticlePicItemInfo yy_modelWithDictionary:dic] ;
//        [tagItemInfoList addObject:itemInfo] ;
//    }
    
//    NSMutableArray *tmplist = [self.editVC.listTagItems mutableCopy] ;
//    [tmplist replaceObjectAtIndex:self.indexInPhotoList withObject:tagItemInfoList] ;
//    self.editVC.listTagItems = tmplist ;
//    [self.editVC refreshCollectionView] ;
//    [self.navigationController popViewControllerAnimated:YES] ;
}

#pragma mark - prop
//- (YXLTagEditorImageView *)tagEditorImageView
//{
//    if (!_tagEditorImageView)
//    {
//        CGRect rect = CGRectZero ;
//        rect.size = CGSizeMake(APP_WIDTH, APP_WIDTH * 1000 / 750) ;
//        _tagEditorImageView = [[YXLTagEditorImageView alloc] initWithImage:self.image
//                                                                     frame:rect] ;
//        _tagEditorImageView.viewC = self ;
//        _tagEditorImageView.userInteractionEnabled = YES ;
//        _tagEditorImageView.center =  self.view.center ;
//    }
//    return _tagEditorImageView ;
//}

- (NSMutableArray *)listMShapeViews
{
    if (!_listMShapeViews) {
        _listMShapeViews = [@[] mutableCopy] ;
    }
    return _listMShapeViews ;
}

- (TagInfomationViewController *)taginfoVC
{
    if (!_taginfoVC) {
        _taginfoVC = (TagInfomationViewController *)[[RootCtrl class] getCtrllerFromStory:@"Camera" controllerIdentifier:@"TagInfomationViewController"] ;
    }
    return _taginfoVC ;
}

- (UILabel *)labelTips
{
    if (!_labelTips)
    {
        _labelTips = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)] ;
        _labelTips.text = @"点击照片\n选择添加相关信息" ;
        _labelTips.font = [UIFont systemFontOfSize:14] ;
        _labelTips.textColor = [UIColor whiteColor] ;
        _labelTips.numberOfLines = 2 ;
        _labelTips.textAlignment = NSTextAlignmentCenter ;
        float lengthLess = APP_HEIGHT - APP_WIDTH * 1000 / 750 ;
        _labelTips.center = CGPointMake(self.view.center.x, APP_WIDTH * 1000 / 750 + lengthLess / 2) ;
    }
    return _labelTips ;
}

- (UIImageView *)imageViewBG
{
    if (!_imageViewBG) {
        CGRect rect = CGRectZero ;
        rect.size = CGSizeMake(APP_WIDTH, APP_WIDTH * 1000 / 750) ;
        _imageViewBG = [[UIImageView alloc] initWithFrame:rect] ;
        _imageViewBG.userInteractionEnabled = YES ;
        _imageViewBG.image = self.image ;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImagesBG:)] ;
        [_imageViewBG addGestureRecognizer:tapGesture] ;
    }
    return _imageViewBG ;
}

- (void)tapImagesBG:(UITapGestureRecognizer *)tapGesture
{
    CGPoint pt = [tapGesture locationInView:self.imageViewBG] ;
    NSLog(@"pt in bg : %@ \nWILL ADD LABEL",NSStringFromCGPoint(pt)) ;
    
    //1 SHOW TAGINFO VIEW
    [self.taginfoVC showInView:self.view
                     addOrEdit:YES] ;

    __weak PhotoTaggingCtrller *weakSelf = self ;
    
    // WILL INPUT PROPERTY .
    self.taginfoVC.inputBlock = ^(NSString *strVal, TypeOfTagInformationTextfield type) {
        
        TagSearchingCtrller *tagSearchVC = (TagSearchingCtrller *)[[RootCtrl class] getCtrllerFromStory:@"Camera" controllerIdentifier:@"TagSearchingCtrller"] ;
        tagSearchVC.block = ^(NSString *text){
            [weakSelf.taginfoVC refreshTextFieldWithType:type string:text] ;
        } ;
        
        [weakSelf.navigationController presentViewController:tagSearchVC
                                                    animated:YES
                                                  completion:^{
            
        }] ;
        
    } ;
    
    
    // FINISHED .
    self.taginfoVC.outputBlock = ^(NSArray *listResultStr, BOOL bAddOrEdit) {
        
        ArticlePicItemInfo *itemInfo = [[ArticlePicItemInfo alloc] init] ;
        itemInfo.brand = listResultStr[0] ;
        itemInfo.sku = listResultStr[1] ;
        itemInfo.currency = listResultStr[2] ;
        itemInfo.price = listResultStr[3] ;
        itemInfo.nation = listResultStr[4] ;
        itemInfo.location = listResultStr[5] ;
        itemInfo.posX = pt.x ;
        itemInfo.posY = pt.y ;
        
        MaxShapeView *pathShapeView = [[MaxShapeView alloc] initWithFrame:CGRectZero
                                                                    point:pt
                                                                 tagGroup:[itemInfo tagGroup]
                                                                  tagType:kMaxTagGroupTypeDefault
                                                               superFrame:weakSelf.view.frame] ;
        
        
        if (bAddOrEdit) {
            //add
            [weakSelf.view addSubview:pathShapeView] ;
            [weakSelf.listMShapeViews addObject:pathShapeView] ;
        }
        else {
            //edit
            
        }
        
        
        
        
        
        
        pathShapeView.tapBlock = ^(MaxShapeView *shapeView, UILabel *tapLabel) {
            if (tapLabel)
            {
                //单击 编辑
                [weakSelf.taginfoVC showInView:weakSelf.view
                                     addOrEdit:NO] ;
                [weakSelf.taginfoVC refreshUIsWithArticlePicItemInfo:itemInfo] ;
            }
        };
        
        pathShapeView.longPressBlock = ^(MaxShapeView *shapeView){
            //长按 删除
            NSLog(@"%s__%d", __func__, __LINE__) ;
        };
    } ;

    
    // CANCELED .
    self.taginfoVC.cancelBlock = ^(void) {
        weakSelf.taginfoVC = nil ;
    } ;
}


#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    // tip
    [self.view addSubview:self.labelTips] ;
    // bg
    [self.view addSubview:self.imageViewBG] ;
    
//    [self.view addSubview:self.tagEditorImageView];
//    [self.tagEditorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    
    
    [self configureUIs] ;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated] ;
    
//    if (self.items != nil && ![self.items isKindOfClass:[NSNull class]]) {
//        for (int i = 0; i < self.items.count; i++)
//        {
//            ArticlePicItemInfo *itemInfo = self.items[i] ;
//            [self.tagEditorImageView addTagViewText:itemInfo.text
//                                           Location:CGPointMake(itemInfo.posX, itemInfo.posY)
//                              isPositiveAndNegative:[itemInfo positiveOrNagitive]
//                                               type:itemInfo.type] ;
//        }
//    }
}


- (void)configureUIs
{
    _topView.backgroundColor = [UIColor xt_editor_bar] ;
    self.view.backgroundColor = [UIColor xt_editor_bg] ;
    [_btSave setTitleColor:[UIColor xt_editor_w] forState:0] ;
    [_btback setTitleColor:[UIColor xt_editor_w] forState:0] ;
    _labelTitle.textColor = [UIColor xt_editor_w] ;
    _labelTitle.text = @"添加标签" ;
    [self.view bringSubviewToFront:self.topView] ;
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
