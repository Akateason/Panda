//
//  RankingOverallCtrl.m
//  GroupBuying
//
//  Created by TuTu on 16/10/12.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RankingOverallCtrl.h"
#import "RankingUserCell.h"
#import "XTSegment.h"

static const float kHeightSegment = 45. ;

@interface RankingOverallCtrl () <UITableViewDelegate,UITableViewDataSource,RootTableViewDelegate,XTSegmentDelegate>

@property (weak, nonatomic) IBOutlet RootTableView *table;
@property (nonatomic,strong)         XTSegment     *segment ;

@end

@implementation RankingOverallCtrl

#pragma -
- (void)scroll2Top
{
    [self.table setContentOffset:CGPointZero animated:YES] ;
}

#pragma mark - XTSegmentDelegate
- (void)clickSegmentWith:(int)index
{
    NSLog(@"index : %d",index) ;

    
}

#pragma - prop
- (XTSegment *)segment
{
    if (!_segment) {
        _segment = [[XTSegment alloc] initWithDataList:@[@"综合",@"按月",@"按人气",@"按笔记数"]
                                                 imgBg:[UIImage imageNamed:@"btbg"]
                                                height:kHeightSegment
                                           normalColor:[UIColor xt_w_light]
                                           selectColor:[UIColor whiteColor]
                                                  font:[UIFont systemFontOfSize:13.]
                                                 frame:APPFRAME] ;
        _segment.backgroundColor = [UIColor whiteColor] ;
        _segment.delegate = self ;
        _segment.frame = CGRectMake(0, 0, APP_WIDTH, kHeightSegment) ;
        if (!_segment.superview) {
            [self.view addSubview:_segment] ;
        }
    }
    return _segment ;
}


#pragma - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self tableConfigure] ;
    [self segment] ;
}

- (void)tableConfigure
{
    _table.backgroundColor = [UIColor whiteColor] ;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone ;
    _table.delegate = self ;
    _table.dataSource = self ;
    _table.xt_Delegate = self ;
    [_table registerNib:[UINib nibWithNibName:kID_RankingUserCell bundle:nil] forCellReuseIdentifier:kID_RankingUserCell] ;
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
    return 10 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RankingUserCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_RankingUserCell] ;
    cell.index = (int)indexPath.row ;
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 77. ;
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
