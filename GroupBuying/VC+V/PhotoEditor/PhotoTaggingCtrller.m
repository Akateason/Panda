//
//  PhotoTaggingCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/1.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PhotoTaggingCtrller.h"
#import "YXLTagEditorImageView.h"
#import "ArticlePicItemInfo.h"
#import "YYModel.h"

@interface PhotoTaggingCtrller ()<UIGestureRecognizerDelegate>

// story board
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *btback;
@property (weak, nonatomic) IBOutlet UIButton *btSave;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
// code
@property (nonatomic,strong)YXLTagEditorImageView *tagEditorImageView;

@end

@implementation PhotoTaggingCtrller


#pragma mark - action
- (IBAction)btBackOnClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES] ;
}

// 确定并pop    返回这个图片所有的标签地址内容，是否翻转样式的数组   坐标为这个图片的真实坐标
- (IBAction)btSaveOnClick:(id)sender
{
    NSMutableArray *dicList = [self.tagEditorImageView popTagModel];
    if (dicList.count == 0)
    {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
   
    NSMutableArray *tagItemInfoList = [@[] mutableCopy] ;
    for (NSDictionary *dic in dicList)
    {
        ArticlePicItemInfo *itemInfo = [ArticlePicItemInfo yy_modelWithDictionary:dic] ;
        [tagItemInfoList addObject:itemInfo] ;
    }
    
    NSMutableArray *tmplist = [self.editVC.listTagItems mutableCopy] ;
    [tmplist replaceObjectAtIndex:self.indexInPhotoList withObject:tagItemInfoList] ;
    self.editVC.listTagItems = tmplist ;

    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - prop
- (YXLTagEditorImageView *)tagEditorImageView
{
    if (!_tagEditorImageView) {
        _tagEditorImageView = [[YXLTagEditorImageView alloc] initWithImage:nil] ;
        _tagEditorImageView.viewC = self ;
        _tagEditorImageView.userInteractionEnabled = YES;
    }
    return _tagEditorImageView ;
}

#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tagEditorImageView];
    [self.tagEditorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tagEditorImageView.imagePreviews.image = self.image ;
    [self.tagEditorImageView scaledFrame] ;
    
    [_tagEditorImageView addTagViewText:@"哈哈哈哈" Location:CGPointMake(111,222) isPositiveAndNegative:YES type:@"LOCATION"] ;
    [_tagEditorImageView addTagViewText:@"哈哈lalallallal" Location:CGPointMake(222, 111) isPositiveAndNegative:NO type:@"LOCATION"] ;
    
    
    [self configureUIs] ;

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
