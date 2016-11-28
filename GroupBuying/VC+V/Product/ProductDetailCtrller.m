//
//  ProductDetailCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/11/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ProductDetailCtrller.h"
#import "ProductHeadCell.h"

@interface ProductDetailCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet RootTableView  *table;
@property (weak, nonatomic) IBOutlet UIView         *bottomBar;
@property (weak, nonatomic) IBOutlet UIButton       *btAddToShopCart;
@property (weak, nonatomic) IBOutlet UIButton       *btCollection;
@property (weak, nonatomic) IBOutlet UIButton       *btBuyNow;

@end

@implementation ProductDetailCtrller

#pragma - actions
- (IBAction)btAddToShopCartOnClick:(id)sender
{
    
}

- (IBAction)btCollectionOnClick:(id)sender
{
    
}

- (IBAction)btBuyNowOnClick:(id)sender
{
    
}

#pragma - life
- (void)viewDidLoad
{
    [super viewDidLoad] ;
    // Do any additional setup after loading the view.
    [self configureUIs] ;
    [self configureTable] ;
}

- (void)configureUIs
{
    _bottomBar.backgroundColor = [UIColor whiteColor] ;
    _btAddToShopCart.backgroundColor = [UIColor xt_tabbarRedColor] ;
    [_btCollection setTitleColor:[UIColor xt_w_desc] forState:0] ;
    [_btBuyNow setTitleColor:[UIColor xt_w_desc] forState:0] ;
}

- (void)configureTable
{
    [_table registerNib:[UINib nibWithNibName:kID_ProductHeadCell bundle:nil] forCellReuseIdentifier:kID_ProductHeadCell] ;
    
    _table.backgroundColor = [UIColor xt_seperate] ;
    _table.separatorStyle = 0 ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
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
    return 2 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = (int)indexPath.row ;
    
    if (row == 0) { 
        ProductHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_ProductHeadCell] ;
        return cell ;
    }
    else if (row == 1) {
        
    }
    return nil ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = (int)indexPath.row ;
    if (row == 0) {
        return [ProductHeadCell calculateHeightWithProductName:@"heheda?????????????????"] ;
    }
    else if (row == 1) {
        return APP_HEIGHT ;
    }
    return 0. ;
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
