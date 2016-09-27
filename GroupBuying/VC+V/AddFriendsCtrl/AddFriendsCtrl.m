//
//  AddFriendsCtrl.m
//  GroupBuying
//
//  Created by TuTu on 16/9/27.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "AddFriendsCtrl.h"
#import "AddFriendCell.h"

@interface AddFriendsCtrl () <UITableViewDelegate,UITableViewDataSource,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *schBarBg;
@property (weak, nonatomic) IBOutlet UIView *schBarBg2;
@property (weak, nonatomic) IBOutlet UITextField *tf_search;

@property (weak, nonatomic) IBOutlet RootTableView *table;

@end

@implementation AddFriendsCtrl

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加好友" ;
    
    _schBarBg.backgroundColor = [UIColor xt_seperate] ;
    _schBarBg2.backgroundColor = [UIColor whiteColor] ;
    _schBarBg2.layer.cornerRadius = 5. ;
    
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
    _table.separatorStyle = 0 ;
    [_table registerNib:[UINib nibWithNibName:kID_AddFriendCell bundle:nil] forCellReuseIdentifier:kID_AddFriendCell] ;
    
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
    return 4 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_AddFriendCell] ;
    
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [AddFriendCell getHeight] ;
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
