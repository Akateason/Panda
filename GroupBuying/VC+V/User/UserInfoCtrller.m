//
//  UserInfoCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/8/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UserInfoCtrller.h"
#import "RootTableView.h"
#import "ParallaxHeaderView.h"
#import "ParallaxHeaderView.h"
#import "UserInfoView.h"

@interface UserInfoCtrller () <UITableViewDelegate,UITableViewDataSource,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet RootTableView  *table;
@property (nonatomic,strong) ParallaxHeaderView     *paralax ;
@property (nonatomic,strong) UserInfoView           *userinfoView ;
@end

@implementation UserInfoCtrller

#pragma mark - prop
- (UserInfoView *)userinfoView
{
    if (!_userinfoView) {
        CGRect rect = CGRectZero ;
        rect.size.width = APP_WIDTH ;
        rect.size.height = [UserInfoView getHeight] ;
        _userinfoView = [[[NSBundle mainBundle] loadNibNamed:@"UserInfoView" owner:self options:nil] lastObject] ;
        _userinfoView.frame = rect ;
    }
    return _userinfoView ;
}


#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _table.delegate = self ;
    _table.dataSource = self ;
    _table.separatorStyle = 0 ;
    _table.xt_Delegate = self ;
    
    [self userinfoView] ;
    
    self.paralax = ({
        ParallaxHeaderView *header = [ParallaxHeaderView parallaxHeaderViewWithSubView:self.userinfoView] ;
        header ;
    }) ;
    
    [_table setTableHeaderView:self.paralax] ;
}

- (void)viewDidAppear:(BOOL)animated
{
    [(ParallaxHeaderView *)self.table.tableHeaderView refreshBlurViewForNewImage] ;
    
    [super viewDidAppear:animated];
}


#pragma mark - RootTableViewDelegate
- (void)loadNewData
{
    //    if (_dataList.count) [self.dataList removeAllObjects] ;
    //
    //    ResultParsered *result = [ServerRequest getHomePageInfoResultWithSinceID:0 AndMaxID:0 AndCount:20] ;
    //    for (NSDictionary *dicArticle in result.info[@"items"][@"articles"][@"article_list"]) {
    //        Article *article = [Article yy_modelWithJSON:dicArticle] ;
    //        [self.dataList addObject:article] ;
    //    }
}

- (void)loadMoreData
{
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierUserInfoCell] ;
//    if (!cell) {
//        cell = [tableView dequeueReusableCellWithIdentifier:identifierUserInfoCell] ;
//    }
//    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return [UserInfoCell getHeight] ;
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.paralax layoutHeaderViewForScrollViewOffset:scrollView.contentOffset] ;
  
  
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
