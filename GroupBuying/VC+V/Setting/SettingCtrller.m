//
//  SettingCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/23.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "SettingCtrller.h"
#import "SettingCell.h"
#import "SIAlertView.h"
#import "UserOnDevice.h"
#import "MineUserEditCtrl.h"
#import "SDImageCache.h"
#import "SVProgressHUD.h"
#import "ChangeSecretCtrller.h"


@interface SettingCtrller () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation SettingCtrller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置" ;
    
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    [_table registerNib:[UINib nibWithNibName:kID_SettingCell bundle:nil] forCellReuseIdentifier:kID_SettingCell] ;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2 ;
    }
    else if (section == 1) {
        return 1 ;
    }
    else if (section == 2) {
        return 2 ;
    }
    else if (section == 3) {
        if ([UserOnDevice currentUserOnDevice] != nil) {
            return 1 ;
        }
    }

    return 0 ;
}

static NSString *const identifierExitlogCell = @"exitCell" ;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    NSInteger row = indexPath.row ;
    if (section == 0) {
        if (row == 0) {
            return [self getSettingCellWithKey:@"个人资料"] ;
        }
        else if (row == 1) {
            return [self getSettingCellWithKey:@"修改密码"] ;
        }
    }
    else if (section == 1) {
        return [self getSettingCellWithKey:@"清楚缓存"] ;
    }
    else if (section == 2) {
        if (row == 0) {
            return [self getSettingCellWithKey:@"关于我们"] ;
        }
        else if (row == 1) {
            return [self getSettingCellWithKey:@"帮助中心"] ;
        }
    }
    else if (section == 3) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierExitlogCell] ;
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierExitlogCell] ;
            cell.textLabel.text = @"退出账号" ;
            cell.textLabel.textAlignment = NSTextAlignmentCenter ;
            cell.textLabel.textColor = [UIColor xt_w_dark] ;
            cell.textLabel.font = Font(14.) ;
            cell.selectionStyle = 0 ;
        }
        return cell ;
    }

    return nil ;
}


- (SettingCell *)getSettingCellWithKey:(NSString *)key
{
    SettingCell *cell = [_table dequeueReusableCellWithIdentifier:kID_SettingCell] ;
    cell.displayStr = key ;
    return cell ;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54. ;
}

static NSString *const kIdentifierFooter = @"mycell_footer" ;

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kIdentifierFooter] ;
    if (!footer) {
        footer = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:kIdentifierFooter] ;
        UIView *bView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, 15.)] ;
        bView.backgroundColor = [UIColor xt_seperate] ;
        footer.backgroundView = bView ;
    }
    return footer ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) return 30. ;

    return 15. ;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    NSInteger row = indexPath.row ;
    

    if (section == 0) {
        if (row == 0) {
        // @"个人资料"
            MineUserEditCtrl *userEditVC = (MineUserEditCtrl *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MineUserEditCtrl"] ;
            [self.navigationController pushViewController:userEditVC animated:YES] ;
        }
        else if (row == 1) {
        // @"修改密码"
            ChangeSecretCtrller * changeSecretVC = (ChangeSecretCtrller *)[[ChangeSecretCtrller class] getCtrllerFromStory:@"Login" controllerIdentifier:@"ChangeSecretCtrller"] ;
            [self.navigationController pushViewController:changeSecretVC animated:YES] ;
        }
    }
    else if (section == 1) {
        // @"清楚缓存"] ;
        SIAlertView *alert = [[SIAlertView alloc] initWithTitle:nil andMessage:@"确实要清除缓存吗?"] ;
        [alert addButtonWithTitle:@"确认" type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alertView) {
            [SVProgressHUD show] ;
            [[SDImageCache sharedImageCache] cleanDiskWithCompletionBlock:^{
                [SVProgressHUD dismiss] ;
            }] ;
        }] ;
        [alert addButtonWithTitle:@"取消" type:SIAlertViewButtonTypeCancel handler:nil] ;
        [alert show] ;
    }
    else if (section == 2) {
        if (row == 0) {
        // @"关于我们"] ;
            [self performSegueWithIdentifier:@"setting2aboutus" sender:nil] ;
        }
        else if (row == 1) {
        // @"帮助中心"] ;
        }
    }
    else if (section == 3) {
    // "退出账号" ;
        SIAlertView *alert = [[SIAlertView alloc] initWithTitle:nil andMessage:@"退出登录"] ;
        [alert addButtonWithTitle:@"确认" type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alertView) {
            [UserOnDevice clean] ;
            [self.navigationController popViewControllerAnimated:YES] ;
        }] ;
        [alert addButtonWithTitle:@"取消" type:SIAlertViewButtonTypeCancel handler:nil] ;
        [alert show] ;
    }

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
