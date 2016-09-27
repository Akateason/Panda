//
//  RegisterViewController.m
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RegisterViewController.h"
#import "SVProgressHUD.h"
#import "YYModel.h"
#import "UserOnDevice.h"
#import "UIButton+Countdown.h"

@interface RegisterViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tf_phone;
@property (weak, nonatomic) IBOutlet UITextField *tf_nickname;
@property (weak, nonatomic) IBOutlet UITextField *tf_password;
@property (weak, nonatomic) IBOutlet UITextField *tf_passCorrect;
@property (weak, nonatomic) IBOutlet UITextField *tf_checkCode;
@property (weak, nonatomic) IBOutlet UIButton *btCheckCode;
@property (weak, nonatomic) IBOutlet UIButton *btRegister;

@end

@implementation RegisterViewController

- (IBAction)touchView:(id)sender
{
    [self.view endEditing:YES] ;
}

- (IBAction)btCheckCodeOnClick:(UIButton *)sender
{
    NSLog(@"发送验证码") ;
    if (!_tf_phone.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"] ;
        return ;
    }
    
    
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

- (IBAction)btRegisterOnClick:(id)sender
{
    NSLog(@"注册") ;
    
    if (!self.tf_phone.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"] ;
        return ;
    }
    else if (!self.tf_password.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"] ;
        return ;
    }
    else if (![self.tf_password.text isEqualToString:self.tf_passCorrect.text]) {
        [SVProgressHUD showErrorWithStatus:@"两次输入密码不一致"] ;
        return ;
    }
    else if (!self.tf_checkCode.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入验证码"] ;
        return ;
    }
    
    [ServerRequest validVerifyCode:self.tf_phone.text
                        verifyCode:self.tf_checkCode.text
                           success:^(id json) {
                               ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                               if (result.code == 1) {
                                   
                                   [self goRegister] ;
                                   
                               }
                               else {
                                   [SVProgressHUD showErrorWithStatus:@"验证码错误"] ;
                               }
                           } fail:^{
                               
                           }] ;
    
    

   
}

- (void)goRegister
{
    [ServerRequest registerWithUserName:self.tf_phone.text
                               password:self.tf_password.text
                               nickname:self.tf_nickname.text
                                success:^(id json) {
                                    
                                    ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                    if (result.code == 1)
                                    {
                                        NSString *token = result.data[@"token"] ;
                                        User *user = [UserOnDevice yy_modelWithJSON:result.data[@"user"]] ;
                                        [UserOnDevice cacheToken:token] ;
                                        [UserOnDevice cacheUserName:user.mobile
                                                           password:self.tf_password.text] ;
                                        [UserOnDevice cacheUserCurrent:user] ;
                                        
                                        [self dismissViewControllerAnimated:YES
                                                                 completion:^{
                                                                 }] ;
                                    }
                                    else if (result.code == -5) {
                                        [SVProgressHUD showErrorWithStatus:@"该手机号已存在"] ;
                                    }
                                    
                                }
                                   fail:^{
                                       
                                   }] ;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
    _btRegister.backgroundColor = [UIColor xt_w_dark] ;
    [_btCheckCode setTitleColor:[UIColor xt_w_dark] forState:0] ;
    
    _tf_phone.delegate = self ;
    _tf_nickname.delegate = self ;
    _tf_password.delegate = self ;
    _tf_passCorrect.delegate = self ;
    _tf_checkCode.delegate = self ;
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //??使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    //设置视图移动的位移
    NSLog(@"textField.bounds.origin.y : %lf",textField.bounds.origin.y) ;
    NSLog(@"textField.frame.origin.y : %lf",textField.frame.origin.y) ;
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - textField.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    //设置动画结束
    [UIView commitAnimations];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //??使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    //设置视图移动的位移
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + textField.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    //设置动画结束
    [UIView commitAnimations];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
