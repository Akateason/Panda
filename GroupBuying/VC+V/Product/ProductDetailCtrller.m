//
//  ProductDetailCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/11/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ProductDetailCtrller.h"
#import "ProductHeadCell.h"
#import "PDVCSegmentHeaderView.h"
#import "ProductDetailCell.h"

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
    self.title = @"产品详情" ;
    [self configureUIs] ;
    [self configureTable] ;
}

- (void)configureUIs
{
    _bottomBar.backgroundColor = [UIColor xt_seperate] ;
    _btAddToShopCart.backgroundColor = [UIColor xt_tabbarRedColor] ;
    [_btCollection setTitleColor:[UIColor xt_w_desc] forState:0] ;
    [_btBuyNow setTitleColor:[UIColor xt_w_desc] forState:0] ;
    _btCollection.backgroundColor = [UIColor whiteColor] ;
    _btBuyNow.backgroundColor = [UIColor whiteColor] ;
    
}

- (void)configureTable
{
    [_table registerNib:[UINib nibWithNibName:kID_ProductHeadCell bundle:nil] forCellReuseIdentifier:kID_ProductHeadCell] ;
    [_table registerClass:[PDVCSegmentHeaderView class] forHeaderFooterViewReuseIdentifier:kID_PDVCSegmentHeaderView] ;
    [_table registerNib:[UINib nibWithNibName:kID_ProductDetailCell bundle:nil] forCellReuseIdentifier:kID_ProductDetailCell] ;
    
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section = (int)indexPath.section ;
    
    if (section == 0) {
        ProductHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_ProductHeadCell] ;
        return cell ;
    }
    else if (section == 1) {
        ProductDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_ProductDetailCell] ;
        return cell ;
    }
    return nil ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section = (int)indexPath.section ;
    if (section == 0) {
        return [ProductHeadCell calculateHeightWithProductName:@"heheda?????????????????"] ;
    }
    else if (section == 1) {
        return APP_HEIGHT ;
    }
    return 0. ;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        PDVCSegmentHeaderView *header = [[PDVCSegmentHeaderView alloc] initWithReuseIdentifier:kID_PDVCSegmentHeaderView] ;
        return header ;
    }
    return nil ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return kHeight_PDVCSegmentHeaderView ;
    }
    return 0.0f ;
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
