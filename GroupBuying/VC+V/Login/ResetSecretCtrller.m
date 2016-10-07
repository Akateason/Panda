//
//  ResetSecretCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ResetSecretCtrller.h"
#import "UserOnDevice.h"
#import "SVProgressHUD.h"

@interface ResetSecretCtrller ()

@property (weak, nonatomic) IBOutlet UITextField *tf_password;
@property (weak, nonatomic) IBOutlet UITextField *tf_password2;
@property (weak, nonatomic) IBOutlet UILabel *lb_desc;
@property (weak, nonatomic) IBOutlet UIButton *btCommit;

@end

@implementation ResetSecretCtrller

- (IBAction)btCommitOnClick:(id)sender
{
    User *userCurrent = [UserOnDevice currentUserOnDevice] ;
    
    [ServerRequest resetPasswordWithIdentifier:userCurrent.mobile
                                   newpassword:_tf_password.text
                                          code:_code
                                       success:^(id json) {
                                           
                                           ResultParsered *result = [[ResultParsered alloc] initWithDic:json] ;
                                           if (result.code == 1) {
                                               [SVProgressHUD showSuccessWithStatus:@"重置密码成功"] ;
                                               [self dismissViewControllerAnimated:YES
                                                                        completion:nil] ;
                                           }
                                           else {
                                               [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"错误码%ld",result.code]] ;
                                           }
                                           
                                       } fail:^{
                                           
                                       }] ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"重置密码" ;
    
    _tf_password.textColor = [UIColor xt_w_dark] ;
    _tf_password2.textColor = [UIColor xt_w_dark] ;
    _lb_desc.textColor = [UIColor xt_w_desc] ;
    _btCommit.backgroundColor = [UIColor blackColor] ;
    [_btCommit setTitleColor:[UIColor whiteColor] forState:0] ;
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
