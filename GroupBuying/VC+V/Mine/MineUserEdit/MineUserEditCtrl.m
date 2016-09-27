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

@interface MineUserEditCtrl () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table ;

@end

@implementation MineUserEditCtrl

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
        return 5 ;
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
            return [self getEditCellWithKey:@"昵称" val:nil] ;
        }
        else if (row == 1) {
            return [self getEditCellWithKey:@"性别" val:nil] ;
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
            return [self getEditCellWithKey:@"手机号码" val:nil] ;
        }
        else if (row == 1) {
            return [self getEditCellWithKey:@"真实姓名" val:nil] ;
        }
        else if (row == 2) {
            return [self getEditCellWithKey:@"身份证" val:nil] ;
        }
        else if (row == 3) {
            return [self getEditCellWithKey:@"支付宝" val:nil] ;
        }
        else if (row == 4) {
            return [self getEditCellWithKey:@"银行卡" val:nil] ;
        }
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
    else if (section == 1) {
        if (row == 0) {
            //@"昵称"
        }
        else if (row == 1) {
            //@"性别"
        }
        else if (row == 2) {
            //@"生日"
        }
        else if (row == 3) {
            //@"简介"
        }
    }
    else if (section == 2) {
        if (row == 0) {
            //@"手机号码"
        }
        else if (row == 1) {
            //@"真实姓名"
        }
        else if (row == 2) {
            //@"身份证"
        }
        else if (row == 3) {
            //@"支付宝"
        }
        else if (row == 4) {
            //@"银行卡"
        }
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
