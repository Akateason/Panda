//
//  PhotoTaggingCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/1.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PhotoTaggingCtrller.h"
#import "YXLTagEditorImageView.h"


//#import "PhotoTaggingStageView.h"

@interface PhotoTaggingCtrller ()<UIGestureRecognizerDelegate>
{
    YXLTagEditorImageView *tagEditorImageView;
}
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *btback;
@property (weak, nonatomic) IBOutlet UIButton *btSave;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@end

@implementation PhotoTaggingCtrller


#pragma mark - action
- (IBAction)btBackOnClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES] ;
}

//// *  确定并pop    返回这个图片所有的标签地址内容，是否翻转样式的数组   坐标为这个图片的真实坐标
- (IBAction)btSaveOnClick:(id)sender
{
    NSMutableArray *array =[tagEditorImageView popTagModel];
    if (array.count==0) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    NSMutableArray *array1 =[NSMutableArray array];
    for(NSDictionary *dic in array){
        BOOL is =[dic[@"positiveAndNegative"] boolValue];
        NSString *positiveAndNegative ;
        if (is) {
            positiveAndNegative=@"反";
        }else{
            positiveAndNegative=@"正";
        }
        NSString *string =[NSString stringWithFormat:@"方向%@坐标%@文本%@",positiveAndNegative,dic[@"point"],dic[@"text"]];
        [array1 addObject:string];
    }
    NSString *string =[array1 componentsJoinedByString:@"\n"];
    NSLog(@"%@",string) ;
//    _popBlock(string);
    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark - prop


#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureUIs] ;
    
    // Do any additional setup after loading the view.
    tagEditorImageView = [[YXLTagEditorImageView alloc] initWithImage:self.image] ;
    tagEditorImageView.backgroundColor = [UIColor blackColor] ;
    tagEditorImageView.viewC = self ;
    
    tagEditorImageView.userInteractionEnabled = YES;
    [self.view addSubview:tagEditorImageView];
    
    [tagEditorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [tagEditorImageView addTagViewText:@"哈哈哈哈" Location:CGPointMake(111,222) isPositiveAndNegative:YES];
    [tagEditorImageView addTagViewText:@"哈哈lalallallal" Location:CGPointMake(222, 111) isPositiveAndNegative:NO];

    
//    
    [self.view bringSubviewToFront:self.topView] ;
}

- (void)configureUIs
{
    _topView.backgroundColor = [UIColor xt_editor_bar] ;
    self.view.backgroundColor = [UIColor xt_editor_bg] ;
    [_btSave setTitleColor:[UIColor xt_editor_w] forState:0] ;
    [_btback setTitleColor:[UIColor xt_editor_w] forState:0] ;
    _labelTitle.textColor = [UIColor xt_editor_w] ;
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
