//
//  MyOrderListCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/11/7.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyOrderListCtrller.h"
#import "XTSegment.h"
#import "OrderlListCell.h"




#define kLIST_SEGMENT_TITLE  @[@"全部",@"待付款",@"待发货",@"待收货",@"待评价"]

@interface MyOrderListCtrller () <XTSegmentDelegate,UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>
@property (weak, nonatomic) IBOutlet RootTableView *table ;
@property (nonatomic,strong) XTSegment *segment ;

@end

@implementation MyOrderListCtrller

#pragma mark - XTSegmentDelegate

- (void)clickSegmentWith:(int)index
{
    NSLog(@"%@",kLIST_SEGMENT_TITLE[index]) ;
//    self.type_CellDisplay = index ;
//    [_collectionView reloadData] ;
}


#pragma - prop
- (XTSegment *)segment
{
    if (!_segment) {
        _segment = [[XTSegment alloc] initWithDataList:kLIST_SEGMENT_TITLE
                                                 imgBg:[UIImage imageNamed:@"btBase"]
                                                height:40.
                                           normalColor:[UIColor xt_w_dark]
                                           selectColor:[UIColor xt_w_dark]
                                                  font:[UIFont systemFontOfSize:14.]
                                                 frame:CGRectMake(0, 0, APP_WIDTH, 40.)] ;
        _segment.backgroundColor = [UIColor whiteColor] ;
        _segment.delegate = self ;
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
    // Do any additional setup after loading the view.
    self.title = @"我的订单" ;
    [self.view addSubview:self.segment] ;
    
    _table.contentInset = UIEdgeInsetsMake(15, 0, 0, 0) ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    [_table registerNib:[UINib nibWithNibName:kID_OrderlListCell bundle:nil] forCellReuseIdentifier:kID_OrderlListCell] ;
    _table.separatorStyle = 0  ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
}

#pragma mark - roottabledelegate
- (void)loadNewData
{
    
}

- (void)loadMoreData
{
    
}

#pragma mark - tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderlListCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_OrderlListCell] ;
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [OrderlListCell getHeight] ;
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
