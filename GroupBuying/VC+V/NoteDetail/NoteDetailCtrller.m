//
//  NoteDetailCtrller.m
//  GroupBuying
//
//  Created by teason on 16/9/7.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "NoteDetailCtrller.h"
#import "UIAlternativeButton.h"
#import "UIImage+AddFunction.h"
#import "RootTableView.h"

@interface NoteDetailCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>

// storyboard
@property (weak, nonatomic) IBOutlet UIView *bottomBar;
@property (weak, nonatomic) IBOutlet RootTableView *table;
@property (weak, nonatomic) IBOutlet UIAlternativeButton *bt_coupon;
@property (weak, nonatomic) IBOutlet UIAlternativeButton *btLike;
@property (weak, nonatomic) IBOutlet UIAlternativeButton *btComment;
@property (weak, nonatomic) IBOutlet UIAlternativeButton *btCollecion;


@end

@implementation NoteDetailCtrller

#pragma mark - bottom bar actions
- (IBAction)btCouponOnClick:(id)sender {
}

- (IBAction)btLikeOnClick:(UIAlternativeButton *)button {
    button.selected = !button.selected ;
}

- (IBAction)btCommentOnClick:(id)sender {
}

- (IBAction)btCollectionOnClick:(UIAlternativeButton *)button {
    button.selected = !button.selected ;
}



#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureUIs] ;
    
    _table.delegate = self ;
    _table.dataSource = self ;
    _table.xt_Delegate = self ;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated] ;
    _bottomBar.hidden = NO ;
}


- (void)configureUIs
{
    _bottomBar.hidden = YES ;
    _bottomBar.backgroundColor = [UIColor whiteColor] ;
    [_bt_coupon setTitleColor:[UIColor xt_w_desc] forState:0] ;
    [_btLike setTitleColor:[UIColor xt_w_desc] forState:0] ;
    [_btComment setTitleColor:[UIColor xt_w_desc] forState:0] ;
    [_btCollecion setTitleColor:[UIColor xt_w_desc] forState:0] ;
    UIImage *btBgImage = [UIImage imageWithColor:[UIColor xt_tabbarRedColor] size:_btLike.frame.size] ;
    [_bt_coupon setBackgroundImage:btBgImage forState:UIControlStateHighlighted] ;
    [_btLike setBackgroundImage:btBgImage forState:UIControlStateHighlighted] ;
    [_btComment setBackgroundImage:btBgImage forState:UIControlStateHighlighted] ;
    [_btCollecion setBackgroundImage:btBgImage forState:UIControlStateHighlighted] ;
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
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell" ;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier] ;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] ;
    }

    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0 ;
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
