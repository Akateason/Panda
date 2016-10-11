//
//  MineUserEditCtrl.m
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MineUserEditCtrl.h"
#import "MineEditHeadCell.h"
#import "MineEditCell.h"
#import "MineEditAddCtrller.h"
#import "UserOnDevice.h"
#import "User.h"

@interface MineUserEditCtrl () <UITableViewDataSource,UITableViewDelegate>
{
    MineEditAddCtrller *editAddVC ;
}

@property (nonatomic,strong) User *userCurrent ;
@property (weak, nonatomic) IBOutlet UITableView *table ;

@end

@implementation MineUserEditCtrl

#pragma mark - prop
- (User *)userCurrent
{
    if (!_userCurrent) {
        _userCurrent = [UserOnDevice currentUserOnDevice] ;
    }
    return _userCurrent ;
}



#pragma mark - life

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"个人资料" ;
    
    _table.contentInset = UIEdgeInsetsMake(15., 0, 0, 0) ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.separatorColor = [UIColor xt_seperate] ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    [_table registerNib:[UINib nibWithNibName:kID_MineEditHeadCell bundle:nil] forCellReuseIdentifier:kID_MineEditHeadCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_MineEditCell bundle:nil] forCellReuseIdentifier:kID_MineEditCell] ;
    
}




#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1 ;
    }
    else if (section == 1) {
        return 4 ;
    }
    else if (section == 2) {
        return 5 - 2 ;
    }
    
    return 0 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    NSInteger row = indexPath.row ;
    if (section == 0)
    {
        // 头像
        MineEditHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MineEditHeadCell] ;
        return cell ;
    }
    else if (section == 1) {
        if (row == 0) {
            return [self getEditCellWithKey:@"昵称" val:self.userCurrent.nickName] ;
        }
        else if (row == 1) {
            return [self getEditCellWithKey:@"性别" val:self.userCurrent.gender] ;
        }
        else if (row == 2) {
            return [self getEditCellWithKey:@"生日" val:nil] ;
        }
        else if (row == 3) {
            return [self getEditCellWithKey:@"简介" val:nil] ;
        }
    }
    else if (section == 2) {
        if (row == 0) {
            return [self getEditCellWithKey:@"手机号码" val:self.userCurrent.mobile] ;
        }
        else if (row == 1) {
            return [self getEditCellWithKey:@"真实姓名" val:self.userCurrent.name] ;
        }
        else if (row == 2) {
            return [self getEditCellWithKey:@"身份证" val:nil] ;
        }
//        else if (row == 3) {
//            return [self getEditCellWithKey:@"支付宝" val:nil] ;
//        }
//        else if (row == 4) {
//            return [self getEditCellWithKey:@"银行卡" val:nil] ;
//        }
    }
    
    return nil ;
}


- (MineEditCell *)getEditCellWithKey:(NSString *)key
                                 val:(NSString *)val
{
    MineEditCell *cell = [_table dequeueReusableCellWithIdentifier:kID_MineEditCell] ;
    cell.strTitle = key ;
    cell.strValue = val ;
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
    return 15. ;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    NSInteger row = indexPath.row ;
    
    if (section == 0)
    {
        // 头像
        
    }
    else
    {
        editAddVC = [self getEditAddVC] ;
        MineUserEditCtrl __weak *weakSelf = self ;
        
        if (section == 1) {
            if (row == 0) {
                //@"昵称"
                editAddVC.strTitle = @"昵称" ;
                editAddVC.strVal = self.userCurrent.nickName ;
                editAddVC.displayType = type_textField_words ;
                editAddVC.blockValString = ^(NSString *str){
                    weakSelf.userCurrent.nickName = str ;
                } ;
            }
            else if (row == 1) {
                //@"性别"
                editAddVC.strTitle = @"性别" ;
                editAddVC.strVal = self.userCurrent.gender ;
                editAddVC.displayType = type_gender_choose ;
                editAddVC.blockValString = ^(NSString *str){
                    weakSelf.userCurrent.gender = str ;
                } ;
            }
            else if (row == 2) {
                //@"生日"
                editAddVC.strTitle = @"生日" ;
//                editAddVC.strVal = self.userCurrent.gender ;
                editAddVC.displayType = type_birth_choose ;
                editAddVC.blockValString = ^(NSString *str){
//                    weakSelf.userCurrent.gender = str ;
                } ;

            }
            else if (row == 3) {
                //@"简介"
                editAddVC.strTitle = @"简介" ;
//                editAddVC.strVal = self.userCurrent.gender ;
                editAddVC.displayType = type_textview ;
                editAddVC.blockValString = ^(NSString *str){
//                    weakSelf.userCurrent.gender = str ;
                } ;
            }
        }
        else if (section == 2) {
            if (row == 0) {
                //@"手机号码"
                editAddVC.strTitle = @"手机号码" ;
                editAddVC.strVal = self.userCurrent.mobile ;
                editAddVC.displayType = type_textField_number ;
                editAddVC.blockValString = ^(NSString *str){
                    weakSelf.userCurrent.mobile = str ;
                } ;
            }
            else if (row == 1) {
                //@"真实姓名"
                editAddVC.strTitle = @"真实姓名" ;
                editAddVC.strVal = self.userCurrent.name ;
                editAddVC.displayType = type_textField_words ;
                editAddVC.blockValString = ^(NSString *str){
                    weakSelf.userCurrent.name = str ;
                } ;
            }
            else if (row == 2) {
                //@"身份证"
                editAddVC.strTitle = @"身份证" ;
//                editAddVC.strVal = self.userCurrent.name ;
                editAddVC.displayType = type_textField_words ;
                editAddVC.blockValString = ^(NSString *str){
//                    weakSelf.userCurrent.name = str ;
                } ;
            }
            else if (row == 3) {
                //@"支付宝"
            }
            else if (row == 4) {
                //@"银行卡"
            }
        }
        
        [self.navigationController pushViewController:editAddVC animated:YES] ;
    }
    
    

    
}




- (MineEditAddCtrller *)getEditAddVC
{
    return (MineEditAddCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MineEditAddCtrller"] ;
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
