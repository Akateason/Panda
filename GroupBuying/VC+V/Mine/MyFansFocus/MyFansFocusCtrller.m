//
//  MyFansFocusCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/10/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyFansFocusCtrller.h"
#import "MyFansFocusCell.h"

@interface MyFansFocusCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet RootTableView *table;

@property (weak, nonatomic) IBOutlet UIView *topbarbg;
@property (weak, nonatomic) IBOutlet UIView *topbarbg2;
@property (weak, nonatomic) IBOutlet UITextField *tf_search;

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _topbarbg.backgroundColor = [UIColor xt_seperate] ;
    _topbarbg2.layer.cornerRadius = 5. ;
    
    _table.separatorColor = [UIColor xt_seperate] ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
    [_table registerNib:[UINib nibWithNibName:kID_MyFansFocusCell bundle:nil] forCellReuseIdentifier:kID_MyFansFocusCell] ;
    
    
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
    MyFansFocusCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MyFansFocusCell] ;
    [cell setIndex:indexPath.row + 1] ;
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
