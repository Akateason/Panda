//
//  MyFansFocusCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/10/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyFansFocusCtrller.h"
#import "MyFansFocusCell.h"
#import "UserOnDevice.h"
#import "UserFollowViewItem.h"
#import "User.h"
#import "PublicEnum.h"

static const int kHowmany = 20 ;

@interface MyFansFocusCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>
{
    NSString *currentUserID ;
}
@property (weak, nonatomic) IBOutlet RootTableView *table;
@property (weak, nonatomic) IBOutlet UIView *topbarbg;
@property (weak, nonatomic) IBOutlet UIView *topbarbg2;
@property (weak, nonatomic) IBOutlet UITextField *tf_search;

@property (nonatomic,strong) NSArray *listUsers ;

@end

@implementation MyFansFocusCtrller

- (void)setDisplayType:(DISPLAY_TYPE_MFFVC)displayType
{
    _displayType = displayType ;
    
    if (displayType == type_focus) {
        self.title = @"关注的人" ;
    }
    else if (displayType == type_fans) {
        self.title = @"我的粉丝" ;
    }
}

- (void)viewDidLoad
{
    currentUserID = ([UserOnDevice hasLogin]) ? [UserOnDevice currentUserOnDevice].userId : nil ;

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _topbarbg.backgroundColor = [UIColor xt_seperate] ;
    _topbarbg2.layer.cornerRadius = 5. ;

    [_table registerNib:[UINib nibWithNibName:kID_MyFansFocusCell bundle:nil] forCellReuseIdentifier:kID_MyFansFocusCell] ;
    _table.separatorColor = [UIColor xt_seperate] ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
}



#pragma mark - RootTableViewDelegate
- (void)loadNewData
{
    if (self.displayType == type_focus) {
        [ServerRequest getFollowerSearchByID:self.userID
                               currentUserID:currentUserID
                                        from:0
                                     howmany:kHowmany
                                     success:^(id json) {
                                         ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                         [self makeListWithOriginList:@[] result:result] ;
                                     }
                                        fail:^{
                                            
                                        }] ;
    }
    else if (self.displayType == type_fans) {
        [ServerRequest getFansSearchByID:self.userID
                           currentUserID:currentUserID
                                    from:0
                                 howmany:kHowmany
                                 success:^(id json) {
                                     ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                     [self makeListWithOriginList:@[] result:result] ;
                                 } fail:^{
                                     
                                 }] ;
    }

}

- (void)loadMoreData
{
    if (self.displayType == type_focus) {
        [ServerRequest getFollowerSearchByID:self.userID
                               currentUserID:currentUserID
                                        from:(int)self.listUsers.count
                                     howmany:kHowmany
                                     success:^(id json) {
                                         ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                         [self makeListWithOriginList:self.listUsers result:result] ;
                                     }
                                        fail:^{
                                            
                                        }] ;
    }
    else if (self.displayType == type_fans) {
        [ServerRequest getFansSearchByID:self.userID
                           currentUserID:currentUserID
                                    from:(int)self.listUsers.count
                                 howmany:kHowmany
                                 success:^(id json) {
                                     ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                     [self makeListWithOriginList:self.listUsers result:result] ;
                                 } fail:^{
                                     
                                 }] ;
    }
}


- (void)makeListWithOriginList:(NSArray *)orgList
                        result:(ResultParsered *)result
{
    NSMutableArray *tmplist = [orgList mutableCopy] ;
    if (result.code == 1) {
        NSArray *diclist = result.data[@"userFollowList"] ;
        for (NSDictionary *dic in diclist) {
            UserFollowViewItem *viewItem = [UserFollowViewItem yy_modelWithJSON:dic] ;
            [tmplist addObject:viewItem] ;
        }
        self.listUsers = tmplist ;
        [_table reloadData] ;
    }
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listUsers.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyFansFocusCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MyFansFocusCell] ;
    cell.displayType = self.displayType ;
    cell.userViewItem = self.listUsers[indexPath.row] ;
    return cell ;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kHeight_MyFansFocusCell ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
