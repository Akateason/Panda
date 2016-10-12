//
//  RankingOverallCtrl.m
//  GroupBuying
//
//  Created by TuTu on 16/10/12.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RankingOverallCtrl.h"

@interface RankingOverallCtrl ()

@property (weak, nonatomic) IBOutlet RootTableView *table;

@end

@implementation RankingOverallCtrl

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//- (void)tableConfigure
//{
//    _table.backgroundColor = [UIColor whiteColor] ;
//    _table.separatorStyle = UITableViewCellSeparatorStyleNone ;
//    _table.delegate = self ;
//    _table.dataSource = self ;
//    _table.xt_Delegate = self ;
//}

//#pragma mark - RootTableViewDelegate
//- (void)loadNewData
//{
//
//}
//
//- (void)loadMoreData
//{
//
//}

//
//#pragma mark - UITableViewDataSource
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 10 ;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    RankingCell *cell = [tableView dequeueReusableCellWithIdentifier:id_rankingCell] ;
//    if (!cell) {
//        cell = [tableView dequeueReusableCellWithIdentifier:id_rankingCell] ;
//    }
//    cell.index = indexPath.row ;
//
//    return cell ;
//}
//
//#pragma mark - UITableViewDelegate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 120. ;
//}









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
