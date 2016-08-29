//
//  PostCtrller.m
//  GroupBuying
//
//  Created by teason on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PostCtrller.h"
#import "PostContentCell.h"

@interface PostCtrller () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation PostCtrller

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    _table.separatorStyle = 0 ;
    _table.delegate = self ;
    _table.dataSource = self ;
    [_table registerNib:[UINib nibWithNibName:idPostContentCell bundle:nil] forCellReuseIdentifier:idPostContentCell] ;
    
    
    
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostContentCell *cell = [tableView dequeueReusableCellWithIdentifier:idPostContentCell] ;
    
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 194. ;
}








@end
