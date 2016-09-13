//
//  LoginViewController.m
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "LoginViewController.h"
#import "SVProgressHUD.h"
#import "YYModel.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tf_name;
@property (weak, nonatomic) IBOutlet UITextField *tf_password;
@property (weak, nonatomic) IBOutlet UIButton *btLogin;
@property (weak, nonatomic) IBOutlet UIButton *btFast;
@property (weak, nonatomic) IBOutlet UIButton *btForget;

@end

@implementation LoginViewController

- (IBAction)btCancelOnClick:(id)sender
{
    [self dismissViewControllerAnimated:YES
                             completion:^{
    }] ;
}

- (IBAction)btLoginOnClick:(id)sender
{
    NSLog(@"登陆") ;
    if (!self.tf_name.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入用户名/手机号"] ;
        return ;
    }
    if (!self.tf_password.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"] ;
        return ;
    }
    
    [ServerRequest loginWithUserName:_tf_name.text
                            password:_tf_password.text
                             success:^(id json) {
                                 
                                 ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                 
                                 
                             }
                                fail:^{
                                    
                                }] ;
}

- (IBAction)btFastOnClick:(id)sender
{
    NSLog(@"快速登陆") ;
}

- (IBAction)btForgetOnClick:(id)sender
{
    NSLog(@"忘记密码") ;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tf_name.textColor = [UIColor xt_w_desc] ;
    _tf_password.textColor = [UIColor xt_w_desc] ;
    _btLogin.backgroundColor = [UIColor xt_w_dark] ;
    [_btFast setTitleColor:[UIColor xt_w_desc] forState:0] ;
    [_btForget setTitleColor:[UIColor xt_w_desc] forState:0] ;
    
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
