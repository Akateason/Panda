//
//  RankingViewController.m
//  GroupBuying
//
//  Created by TuTu on 16/8/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RankingViewController.h"
#import "XTSegment.h"
#import "RankingCell.h"

@interface RankingViewController () <XTSegmentDelegate,UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *bt2top;
@property (weak, nonatomic) IBOutlet RootTableView *table;
@property (nonatomic,strong) XTSegment *segment ;
@end

@implementation RankingViewController

#pragma mark -
- (XTSegment *)segment
{
    if (!_segment) {
        _segment = [[XTSegment alloc] initWithDataList:@[@"今日热门",@"总排行榜"]
                                                 imgBg:[UIImage imageNamed:@"btBase"]
                                                height:45.
                                           normalColor:[UIColor xt_w_light]
                                           selectColor:[UIColor xt_tabbarRedColor]
                                                  font:[UIFont systemFontOfSize:14.]] ;
        _segment.backgroundColor = [UIColor whiteColor] ;
        _segment.delegate = self ;
        _segment.frame = CGRectMake(0, 0, APP_WIDTH, 45.) ;
        if (!_segment.superview) {
            [self.view addSubview:_segment] ;
        }
    }
    return _segment ;
}

- (IBAction)back2topOnClick:(id)sender
{
    [_table setContentOffset:CGPointZero animated:YES] ;
}

#pragma mark - XTSegmentDelegate 
- (void)clickSegmentWith:(int)index
{
    
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
    return 10 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RankingCell *cell = [tableView dequeueReusableCellWithIdentifier:id_rankingCell] ;
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:id_rankingCell] ;
    }
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120. ;
}

#pragma mark -
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"排行榜" ;
    [self segment] ;
    [self tableConfigure] ;
}

- (void)tableConfigure
{
    _table.backgroundColor = [UIColor whiteColor] ;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone ;
    _table.delegate = self ;
    _table.dataSource = self ;
    _table.xt_Delegate = self ;
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
