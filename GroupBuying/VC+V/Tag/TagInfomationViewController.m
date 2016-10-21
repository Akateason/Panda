//
//  TagInfomationViewController.m
//  GroupBuying
//
//  Created by TuTu on 16/10/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "TagInfomationViewController.h"
#import "RootCtrl.h"

@interface TagInfomationViewController () <UITextFieldDelegate>
{
    BOOL bClearBtClcked ;
}
@property (weak, nonatomic) IBOutlet UIView *topline;
@property (weak, nonatomic) IBOutlet UIView *baseline;
@property (weak, nonatomic) IBOutlet UITextField *tf_brand;
@property (weak, nonatomic) IBOutlet UITextField *tf_name;
@property (weak, nonatomic) IBOutlet UITextField *tf_moneyType;
@property (weak, nonatomic) IBOutlet UITextField *tf_price;
@property (weak, nonatomic) IBOutlet UITextField *tf_countryCity;
@property (weak, nonatomic) IBOutlet UITextField *tf_locationDetail;
@property (weak, nonatomic) IBOutlet UIButton *btCancel;
@property (weak, nonatomic) IBOutlet UIButton *btComplete;


@property (nonatomic,strong) NSArray *tflist ;
@property (nonatomic)        int     maxShapeView_clientID ;

@end

@implementation TagInfomationViewController

#pragma - public

- (void)showInView:(UIView *)view
          clientID:(int)clientID
{
    self.maxShapeView_clientID = clientID ;
    [view addSubview:self.view] ;
}

- (void)refreshTextFieldWithType:(TypeOfTagInformationTextfield)type
                          string:(NSString *)strText
{
    for (UITextField *tf in self.tflist)
    {
        if (tf.tag == type)
        {
            tf.text = strText ;
            break ;
        }
    }
}

- (void)refreshUIsWithArticlePicItemInfo:(ArticlePicItemInfo *)itemInfo
{
    self.tf_brand.text = itemInfo.brand ;
    self.tf_name.text = itemInfo.sku ;
    self.tf_moneyType.text = itemInfo.currency ;
    self.tf_price.text = [NSString stringWithFormat:@"%lf",itemInfo.price] ;     
    self.tf_countryCity.text = itemInfo.nation ;
    self.tf_locationDetail.text = itemInfo.location ;
}



#pragma - action

- (IBAction)btFinishOnClick:(id)sender
{
    BOOL bHasChanged = false ;
    NSMutableArray *tmplist = [@[] mutableCopy] ;
    for (int i = kTAG_TagInfomation_textfield; i < kTAG_TagInfomation_textfield + 6; i++) {
        UITextField *tf = [self.view viewWithTag:i] ;
        [tmplist addObject:tf.text] ;
        if (tf.text.length > 0) bHasChanged = true ;
    }
    
    if (bHasChanged)
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(outputWithResultStrList:clientID:)]) {
            [self.delegate outputWithResultStrList:tmplist clientID:self.maxShapeView_clientID] ;
        }
    }
    
    [self.view removeFromSuperview] ;
}

- (IBAction)btCancelOnClick:(id)sender
{
    for (UITextField *tf in self.tflist) { tf.text = @"" ; }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(cancel)]) {
        [self.delegate cancel] ;
    }
    
    [self.view removeFromSuperview] ;
    
}


#pragma - life

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    // Do any additional setup after loading the view from its nib.
    [self configureUIs] ;
}

- (void)configureUIs
{
    _topline.backgroundColor = [UIColor xt_seperate] ;
    _baseline.backgroundColor = [UIColor xt_seperate] ;
    self.view.backgroundColor = [UIColor colorWithWhite:0.25 alpha:0.8] ;
    _btComplete.backgroundColor = [UIColor xt_tabbarRedColor] ;
    _btCancel.backgroundColor = [UIColor whiteColor] ;
    [_btCancel setTitleColor:[UIColor xt_w_light] forState:0] ;
    _btComplete.layer.cornerRadius = CGHeight(_btComplete.frame) / 2 ;
    _btCancel.layer.cornerRadius = CGHeight(_btCancel.frame) / 2 ;
    
    _tf_brand.delegate = self ;
    _tf_name.delegate = self ;
    _tf_moneyType.delegate = self ;
    _tf_countryCity.delegate = self ;
    _tf_locationDetail.delegate = self ;
    _tf_price.delegate = self ;
    
    self.tflist = @[_tf_brand,_tf_name,_tf_moneyType,_tf_price,_tf_countryCity,_tf_locationDetail] ;
    for (int i = 0; i < self.tflist.count; i++) {
        UITextField *tf = self.tflist[i] ;
        tf.tag = kTAG_TagInfomation_textfield + i ;
    }

}

#pragma - UITextFieldDelegate <NSObject>
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"placeholder : %@",textField.placeholder) ;
    NSLog(@"text : %@",textField.text) ;
    
    if (!bClearBtClcked) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(inputTextFieldWithStrVal:type:)]) {
            [self.delegate inputTextFieldWithStrVal:textField.text type:textField.tag] ;
        }
        
    }
    else {
        bClearBtClcked = NO ;
    }
    
    return NO ;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    bClearBtClcked = YES ;
    return YES ;
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
