//
//  PhotoTaggingCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/1.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PhotoTaggingCtrller.h"
#import "ArticlePicItemInfo.h"
#import "YYModel.h"
#import "TagInfomationViewController.h"
#import "TagSearchingCtrller.h"
#import "MaxShapeView.h"
#import "MaxLightingView.h"

@interface PhotoTaggingCtrller ()<UIGestureRecognizerDelegate,TagInfomationViewControllerDelegate>
{
    CGPoint tapPt ;
}
// story board
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *btback;
@property (weak, nonatomic) IBOutlet UIButton *btSave;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
// code
@property (nonatomic,strong)UILabel               *labelTips ;
@property (nonatomic,strong)UIImageView           *imageViewBG ;
@property (nonatomic,strong)TagInfomationViewController *taginfoVC ;
@property (nonatomic,strong)NSMutableArray        *listMShapeViews ;
@property (nonatomic)       int                   currentMSClientIDWillAdd ;
@end

@implementation PhotoTaggingCtrller


#pragma mark - TagInfomationViewControllerDelegate <NSObject>

// will input go to searchTagVC
- (void)inputTextFieldWithStrVal:(NSString *)strVal
                            type:(TypeOfTagInformationTextfield)type
{
    TagSearchingCtrller *tagSearchVC = (TagSearchingCtrller *)[[RootCtrl class] getCtrllerFromStory:@"Camera" controllerIdentifier:@"TagSearchingCtrller"] ;
    tagSearchVC.tagInfomationType = type ;
    tagSearchVC.block = ^(NSString *text){
        [self.taginfoVC refreshTextFieldWithType:type string:text] ;
    } ;
    [self.navigationController presentViewController:tagSearchVC
                                                animated:YES
                                              completion:^{}] ;

}

// finish
- (void)outputWithResultStrList:(NSArray *)listResultStr
                       clientID:(int)clientID
{
    ArticlePicItemInfo *itemInfo = [[ArticlePicItemInfo alloc] init] ;
    itemInfo.brand = listResultStr[0] ;
    itemInfo.sku = listResultStr[1] ;
    itemInfo.currency = listResultStr[2] ;
    itemInfo.price = [listResultStr[3] doubleValue] ;
    itemInfo.nation = listResultStr[4] ;
    itemInfo.location = listResultStr[5] ;
    itemInfo.posX = tapPt.x ;
    itemInfo.posY = tapPt.y ;
    
    if (clientID == self.currentMSClientIDWillAdd)
    {
        //add tagview
        itemInfo.posType = @"RIGHT" ;
        [self addTagViewWithItemInfo:itemInfo
                            clientID:clientID] ;
    }
    else
    {
        //edit tagview
        [self.listMShapeViews enumerateObjectsUsingBlock:^(MaxShapeView *tmpTagView, NSUInteger idx, BOOL * _Nonnull stop) {
            if (tmpTagView.clientMaxShapeViewID == clientID) {
                tmpTagView.itemInfo = itemInfo ;
                [tmpTagView drawLine] ;
                *stop = YES ;
            }
        }] ;
    }
    
    // clear infoVC
    self.taginfoVC = nil ;
}


// cancel
- (void)cancel
{
    // clear infoVC
    self.taginfoVC = nil ;
}



#pragma mark - action
- (IBAction)btBackOnClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES] ;
}

// 确定并pop
// 返回这个图片所有的标签地址内容，是否翻转样式的数组   坐标为这个图片的真实坐标
- (IBAction)btSaveOnClick:(id)sender
{
    NSMutableArray *tagItemInfoList = [@[] mutableCopy] ;
    [self.listMShapeViews enumerateObjectsUsingBlock:^(MaxShapeView *tagView, NSUInteger idx, BOOL * _Nonnull stop) {
        [tagItemInfoList addObject:tagView.itemInfo] ;
    }] ;
    
    NSMutableArray *tmplist = [self.editVC.listTagItems mutableCopy] ;
    [tmplist replaceObjectAtIndex:self.indexInPhotoList withObject:tagItemInfoList] ;
    self.editVC.listTagItems = tmplist ;
    [self.editVC refreshCollectionView] ;
    [self.navigationController popViewControllerAnimated:YES] ;
}

#pragma mark - prop

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
    _taginfoVC.delegate = self ;
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

// imageBG tap ACTION  --> add tagView
- (void)tapImagesBG:(UITapGestureRecognizer *)tapGesture
{
    tapPt = [tapGesture locationInView:self.imageViewBG] ;
    NSLog(@"pt in bg : %@ \nWILL ADD LABEL",NSStringFromCGPoint(tapPt)) ;
    //1 SHOW TAGINFO VIEW
    [self.taginfoVC showInView:self.view
                     clientID:self.currentMSClientIDWillAdd] ;
}


#pragma mark - util
- (void)addTagViewWithItemInfo:(ArticlePicItemInfo *)itemInfo
                      clientID:(int)clientID
{
    MaxShapeView *tagView = [[MaxShapeView alloc] initWithFrame:CGRectZero
                                                          point:CGPointMake(itemInfo.posX, itemInfo.posY)
                                                       tagGroup:[itemInfo tagGroup]
                                                        tagType:kMaxTagGroupTypeDefault
                                                     superFrame:self.view.frame] ;
    tagView.clientMaxShapeViewID = clientID ;
    tagView.itemInfo = itemInfo ;
    tagView.dragDoneBlock = ^(MaxShapeView *shapeView) {
        NSLog(@"shapeView.point : %@",NSStringFromCGPoint(shapeView.point)) ;
        tapPt = shapeView.point ;
    } ;
    
    tagView.tapBlock = ^(MaxShapeView *shapeView, UILabel *tapLabel) {
        // NSLog(@"cid : %d",shapeView.clientMaxShapeViewID) ;
        if (tapLabel)
        {
            self.taginfoVC = nil ;
            //单击 编辑模式
            [self.taginfoVC showInView:self.view
                              clientID:shapeView.clientMaxShapeViewID] ;
            [self.taginfoVC refreshUIsWithArticlePicItemInfo:shapeView.itemInfo] ;
        }
    } ;
    
    tagView.longPressBlock = ^(MaxShapeView *shapeView){
        //长按 删除
        NSLog(@"cid : %d",shapeView.clientMaxShapeViewID) ;
        SIAlertView *alert = [[SIAlertView alloc] initWithTitle:nil andMessage:@"删除此标签"] ;
        [alert addButtonWithTitle:@"确认" type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alertView) {
            [self.listMShapeViews enumerateObjectsUsingBlock:^(MaxShapeView *tmpTagView, NSUInteger idx, BOOL * _Nonnull stop) {
                if (tmpTagView.clientMaxShapeViewID == shapeView.clientMaxShapeViewID) {
                    [tmpTagView removeFromSuperview] ;
                    [self.listMShapeViews removeObjectAtIndex:idx] ;
                    *stop = YES ;
                }
            }] ;
            
        }] ;
        [alert addButtonWithTitle:@"取消" type:SIAlertViewButtonTypeCancel handler:nil] ;
        [alert show] ;
    };
    
    [self.view addSubview:tagView] ;
    [self.listMShapeViews addObject:tagView] ; // addobj in list .
    self.currentMSClientIDWillAdd ++ ;
}




#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // tagview clientID
    self.currentMSClientIDWillAdd = 1 ;
    // tip
    [self.view addSubview:self.labelTips] ;
    // bg
    [self.view addSubview:self.imageViewBG] ;
    // configure
    [self configureUIs] ;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated] ;
    
    if (self.items != nil && ![self.items isKindOfClass:[NSNull class]]) {
        for (int i = 0; i < self.items.count; i++)
        {
            ArticlePicItemInfo *itemInfo = self.items[i] ;
            tapPt = CGPointMake(itemInfo.posX, itemInfo.posY) ;
            [self addTagViewWithItemInfo:itemInfo
                                clientID:self.currentMSClientIDWillAdd] ;
        }
    }
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
