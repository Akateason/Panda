//
//  ViewController.m
//  GroupBuying
//
//  Created by TuTu on 15/12/23.
//  Copyright © 2015年 teason. All rights reserved.
//

#import "ViewController.h"
#import "RootTableView.h"
#import "ServerRequest.h"
//#import "Article.h"
#import "UIImageView+WebCache.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet RootTableView *table;
@property (strong, nonatomic) NSMutableArray *dataList ;

@end

@implementation ViewController

- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [@[] mutableCopy] ;
    }
    return _dataList ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    _table.delegate = self ;
//    _table.dataSource = self ;
//    _table.xt_Delegate = self ;
//    _table.showRefreshDetail = YES ;
}

#pragma mark - RootTableViewDelegate
- (void)loadNewData
{
    if (_dataList.count) [self.dataList removeAllObjects] ;
    
    ResultParsered *result = [ServerRequest getHomePageInfoResultWithSinceID:0 AndMaxID:0 AndCount:20] ;
//    for (NSDictionary *dicArticle in result.info[@"items"][@"articles"][@"article_list"]) {
//        Article *article = [Article yy_modelWithJSON:dicArticle] ;
//        [self.dataList addObject:article] ;
//    }
}

//- (void)loadMoreData
//{
//    
//}
//
//#pragma mark - UITableViewDataSource
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return _dataList.count ;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *cellIdentifier = @"cell" ;
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier] ;
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] ;
//    }
//    cell.backgroundColor = indexPath.row % 2 ? [UIColor cyanColor] : [UIColor magentaColor] ;
//    Article *article = _dataList[indexPath.row] ;
//    cell.textLabel.text = article.a_content ;
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:article.img] placeholderImage:nil] ;
//    return cell ;
//}
//
//#pragma mark - UITableViewDelegate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 44.0 ;
//}
//


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
