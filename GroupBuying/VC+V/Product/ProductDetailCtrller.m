//
//  ProductDetailCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/11/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ProductDetailCtrller.h"

@interface ProductDetailCtrller ()

@property (weak, nonatomic) IBOutlet RootTableView *table;
@property (weak, nonatomic) IBOutlet UIView *bottomBar;
@property (weak, nonatomic) IBOutlet UIButton *btAddToShopCart;
@property (weak, nonatomic) IBOutlet UIButton *btCollection;
@property (weak, nonatomic) IBOutlet UIButton *btBuyNow;

@end

@implementation ProductDetailCtrller

#pragma - actions
- (IBAction)btAddToShopCartOnClick:(id)sender {
}

- (IBAction)btCollectionOnClick:(id)sender {
}

- (IBAction)btBuyNowOnClick:(id)sender {
}

#pragma - life
- (void)viewDidLoad
{
    [super viewDidLoad] ;
    // Do any additional setup after loading the view.
    [self configureUIs] ;
}

- (void)configureUIs
{
    _table.backgroundColor = [UIColor xt_seperate] ;
    _bottomBar.backgroundColor = [UIColor xt_seperate] ;
    _btAddToShopCart.backgroundColor = [UIColor xt_tabbarRedColor] ;
    
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
