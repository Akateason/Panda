//
//  ForgetSecretCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ForgetSecretCtrller.h"
#import "ResetSecretCtrller.h"
#import "UIButton+Countdown.h"


@interface ForgetSecretCtrller ()

@property (weak, nonatomic) IBOutlet UITextField *tf_phone;
@property (weak, nonatomic) IBOutlet UITextField *tf_code;
@property (weak, nonatomic) IBOutlet UIButton *bt_code;
@property (weak, nonatomic) IBOutlet UIButton *btCommit;

@end

@implementation ForgetSecretCtrller

- (IBAction)btCodeOnClick:(id)sender
{
    NSLog(@"发送验证码") ;

    [ServerRequest sendVerifyCode:_tf_phone.text
                          success:^(id json) {
                              ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                              if (result.code == 1)
                              {
                                  //NSString *checkCode = result.data[@"verificationCode"] ;
                                  
                                  [sender startWithTime:59
                                                  title:@"获取验证码"
                                         countDownTitle:@"(s)"
                                              mainColor:[UIColor whiteColor]
                                             countColor:[UIColor xt_seperate]] ;
                                  
                              }
                          } fail:^{
                              
                          }] ;

}

- (IBAction)btCommitOnClick:(id)sender
{
    NSLog(@"提交") ;
    
    if (!self.tf_phone.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"] ;
        return ;
    }
    else if (!self.tf_code.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入验证码"] ;
        return ;
    }
    
    
    [ServerRequest validVerifyCode:self.tf_phone.text
                        verifyCode:self.tf_code.text
                           success:^(id json) {
                               ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                               if (result.code == 1) {
                                   
                                   ResetSecretCtrller *resetVC = (ResetSecretCtrller *)[[self class] getCtrllerFromStory:@"Login" controllerIdentifier:@"ResetSecretCtrller"] ;
                                   resetVC.code = self.tf_code.text ;
                                   [self.navigationController pushViewController:resetVC animated:YES] ;
                                   
                               }
                               else {
                                   [SVProgressHUD showErrorWithStatus:@"验证码错误"] ;
                               }
                           } fail:^{
                               
                           }] ;
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"找回密码" ;
    _tf_phone.textColor = [UIColor xt_w_dark] ;
    _tf_code.textColor = [UIColor xt_w_dark] ;
    _tf_phone.backgroundColor = [UIColor whiteColor] ;
    _tf_code.backgroundColor = [UIColor whiteColor] ;
    [_bt_code setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btCommit.backgroundColor = [UIColor blackColor] ;
    
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
