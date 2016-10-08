//
//  MessageCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/10/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MessageCtrller.h"
#import "MessageCell.h"

@interface MessageCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet RootTableView *table;

@end

@implementation MessageCtrller

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息" ;
    
    UIBarButtonItem *clearItem = [[UIBarButtonItem alloc] initWithTitle:@"清空"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(clearBtOnClick)] ;
    self.navigationItem.rightBarButtonItem = clearItem ;
    
    
    _table.separatorColor = [UIColor xt_seperate] ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    [_table registerNib:[UINib nibWithNibName:kID_MessageCell bundle:nil] forCellReuseIdentifier:kID_MessageCell] ;
}

- (void)clearBtOnClick
{
    NSLog(@"清空消息") ;
    
}



#pragma mark - RootTableViewDelegate

- (void)loadNewData
{
    
}

- (void)loadMoreData
{
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MessageCell] ;
    
    return cell ;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kHeight_MessageCell ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


static NSString *const kIdentifierFooter = @"mycell_header" ;

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kIdentifierFooter] ;
    if (!header) {
        header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:kIdentifierFooter] ;
        UIView *bView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, 15.)] ;
        bView.backgroundColor = [UIColor xt_seperate] ;
        header.backgroundView = bView ;
    }
    return header ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15. ;
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
