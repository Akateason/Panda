//
//  AddAddressCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/11/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "AddAddressCtrller.h"
#import "AddAddressCell.h"
#import "DefaultAddressCell.h"

@interface AddAddressCtrller () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;
@end

@implementation AddAddressCtrller


- (void)finishBtOnClick
{
    NSLog(@"finish bt") ;
//    switch (indexPath.row) {
//        case 0:
//        {
//            // @"收货人" ;
//            
//        }
//            break;
//        case 1:
//        {
//            // @"手机号码" ;
//            
//        }
//            break;
//        case 2:
//        {
//            // @"国家" ;
//            
//        }
//            break;
//        case 3:
//        {
//            // @"省市区" ;
//            
//        }
//            break;
//        case 4:
//        {
//            // @"详细地址" ;
//            
//        }
//            break;
//        case 5:
//        {
//            // @"邮政编码" ;
//            
//        }
//            break;
//        default:
//            break;
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加新地址" ;
    
    UIBarButtonItem *finishItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishBtOnClick)] ;
    self.navigationItem.rightBarButtonItem = finishItem ;
    
    _table.backgroundColor = [UIColor xt_seperate] ;
    [_table registerNib:[UINib nibWithNibName:kID_AddAddressCell bundle:nil]
 forCellReuseIdentifier:kID_AddAddressCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_DefaultAddressCell bundle:nil]
 forCellReuseIdentifier:kID_DefaultAddressCell] ;
    _table.separatorStyle = 0 ;
    _table.dataSource = self ;
    _table.delegate = self ;
}

#pragma - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 6 ;
    }
    else if (section == 1) {
        return 1 ;
    }
    return 0 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    if (section == 0) {
        AddAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_AddAddressCell] ;
        cell.indexpathRow = (int)indexPath.row ;
        return cell ;
    }
    else if (section == 1) {
        DefaultAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_DefaultAddressCell] ;
        return cell ;
    }
    return nil ;
}

#pragma - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 54. ;
    }
    return 69. ;
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
