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

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UIView *v1;
@property (weak, nonatomic) IBOutlet UIView *v2;
@property (weak, nonatomic) IBOutlet UIView *v3;
@property (weak, nonatomic) IBOutlet UIView *v4;
@property (weak, nonatomic) IBOutlet UIView *v5;

@property (weak, nonatomic) IBOutlet UITextField *tf_phone;
@property (weak, nonatomic) IBOutlet UITextField *tf_nickname;
@property (weak, nonatomic) IBOutlet UITextField *tf_password;
@property (weak, nonatomic) IBOutlet UITextField *tf_passCorrect;
@property (weak, nonatomic) IBOutlet UITextField *tf_checkCode;
@property (weak, nonatomic) IBOutlet UIButton *btCheckCode;
@property (weak, nonatomic) IBOutlet UIButton *btRegister;

@end

@implementation RegisterViewController

- (IBAction)btCheckCodeOnClick:(id)sender
{
    NSLog(@"发送验证码") ;
}

- (IBAction)btRegisterOnClick:(id)sender
{
    NSLog(@"注册") ;
    if (!self.tf_phone.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入用户名/手机号"] ;
        return ;
    }
    if (!self.tf_password.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"] ;
        return ;
    }

    [ServerRequest registerWithUserName:self.tf_phone.text
                               password:self.tf_password.text
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
                                    
                                }
                                   fail:^{
                                       
                                   }] ;
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *bgviews = @[_v1,_v2,_v3,_v4,_v5] ;
    for (UIView *bgV in bgviews)
    {
        bgV.backgroundColor = [UIColor whiteColor] ;
        CGRect rect = CGRectZero ;
        rect.size.width = bgV.frame.size.width ;
        rect.size.height = 1. ;
        UIView *baseline = [[UIView alloc] initWithFrame:rect] ;
        baseline.backgroundColor = [UIColor xt_seperate] ;
        [bgV addSubview:baseline] ;
    }
    _btRegister.backgroundColor = [UIColor xt_w_dark] ;
    [_btCheckCode setTitleColor:[UIColor xt_w_dark] forState:0] ;
    
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
