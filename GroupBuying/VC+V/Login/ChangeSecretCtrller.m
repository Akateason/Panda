//
//  ChangeSecretCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ChangeSecretCtrller.h"
#import "SVProgressHUD.h"
#import "UserOnDevice.h"
#import "YYModel.h"

@interface ChangeSecretCtrller ()

@property (weak, nonatomic) IBOutlet UITextField *tf_old_password;
@property (weak, nonatomic) IBOutlet UITextField *tf_new_password;
@property (weak, nonatomic) IBOutlet UITextField *tf_new_password2;
@property (weak, nonatomic) IBOutlet UIButton *btCommit;

@end

@implementation ChangeSecretCtrller

- (IBAction)btCommitOnClick:(id)sender
{
    if (!_tf_old_password.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入旧密码"] ;
    }
    else if (!_tf_new_password.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入新密码"] ;
    }
    else if (!_tf_new_password2.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入确认密码"] ;
    }
    else if (![_tf_new_password.text isEqualToString:_tf_new_password2.text]) {
        [SVProgressHUD showErrorWithStatus:@"两次输入密码不一致"] ;
    }
    
    NSString *token = [UserOnDevice token] ;
    [ServerRequest changePasswordWithToken:token
                               oldPassword:_tf_old_password.text
                               newPassword:_tf_new_password.text
                                   success:^(id json) {
                                       
                                       ResultParsered *result = [[ResultParsered alloc] initWithDic:json] ;
                                       if (result.code == 1)
                                       {
                                           [SVProgressHUD showSuccessWithStatus:@"修改密码成功"] ;
                                           [self.navigationController popViewControllerAnimated:YES] ;
                                       }
                                       else {
                                           [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"错误码%ld",result.code]] ;
                                       }
                                       
                                   } fail:^{
                                       
                                   }] ;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad] ;
    // Do any additional setup after loading the view.
    self.title = @"修改密码" ;
    _btCommit.backgroundColor = [UIColor blackColor] ;
    [_btCommit setTitleColor:[UIColor whiteColor] forState:0] ;
    _tf_old_password.textColor = [UIColor xt_w_dark] ;
    _tf_new_password.textColor = [UIColor xt_w_dark] ;
    _tf_new_password2.textColor = [UIColor xt_w_dark] ;
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
