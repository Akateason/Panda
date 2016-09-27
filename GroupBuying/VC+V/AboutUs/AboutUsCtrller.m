//
//  AboutUsCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/27.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "AboutUsCtrller.h"
#import "MineEditCell.h"


@interface AboutUsCtrller () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UILabel *labelLogo;

@end

@implementation AboutUsCtrller

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"关于我们" ;
    
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.separatorColor = [UIColor xt_seperate] ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    _table.contentInset = UIEdgeInsetsMake(1, 0, 0, 0) ;
    [_table registerNib:[UINib nibWithNibName:kID_MineEditCell bundle:nil] forCellReuseIdentifier:kID_MineEditCell] ;
}




#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row ;
    if (row == 0) {
        return [self getEditCellWithKey:@"检查更新"] ;
    }
    else if (row == 1) {
        return [self getEditCellWithKey:@"常见问题"] ;
    }
    else if (row == 2) {
        return [self getEditCellWithKey:@"服务条款"] ;
    }
    else if (row == 3) {
        return [self getEditCellWithKey:@"隐私条款"] ;
    }
    return nil ;
}

- (MineEditCell *)getEditCellWithKey:(NSString *)key
{
    MineEditCell *cell = [_table dequeueReusableCellWithIdentifier:kID_MineEditCell] ;
    cell.strTitle = key ;
    cell.strValue = @"" ;
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
    if (row == 0) {
        // @"检查更新"
    }
    else if (row == 1) {
        // @"常见问题"
    }
    else if (row == 2) {
        // @"服务条款"
    }
    else if (row == 3) {
        // @"隐私条款"
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
