//
//  SearchConditionTableView.m
//  GroupBuying
//
//  Created by TuTu on 16/11/4.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "SearchConditionTableView.h"
#import "SearchConditionCell.h"

@interface SearchConditionTableView () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) int selectedIndex ;
@property (nonatomic,strong) NSArray *listConditions ; // 综合,按时间,按热度
@end

@implementation SearchConditionTableView

- (void)makeIndexBeChoosen:(int)index
{
    self.selectedIndex = index ;
    [self reloadData] ;
}

- (void)setListConditions:(NSArray *)listConditions
{
    _listConditions = listConditions ;
    
    if (!listConditions) return ;
    self.frame = CGRectMake(0, 0, APP_WIDTH, listConditions.count * 44.) ;
    [self reloadData] ;
}

- (int)resultSelectedIndex
{
    return self.selectedIndex ;
}

- (void)setSelectedIndex:(int)selectedIndex
{
    _selectedIndex = selectedIndex ;
    
    NSLog(@"result %d",selectedIndex) ;
}

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style] ;
    if (self) {
        [self registerNib:[UINib nibWithNibName:kID_SearchConditionCell bundle:nil] forCellReuseIdentifier:kID_SearchConditionCell] ;
        self.scrollEnabled = false ;
        self.bounces = false ;
        self.dataSource = self ;
        self.delegate = self ;
        self.separatorStyle = 0 ;
        
        self.selectedIndex = 0 ; //综合 .
    }
    return self ;
}

#pragma - UITableViewDataSource<NSObject>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listConditions.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchConditionCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_SearchConditionCell] ;
    cell.accessoryType = (self.selectedIndex == indexPath.row) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone ;
    cell.lbTitle.text = self.listConditions[indexPath.row] ;
    return cell ;
}

#pragma - UITableViewDelegate<NSObject, UIScrollViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44. ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self makeIndexBeChoosen:(int)indexPath.row] ;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
