//
//  UserInfoCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/8/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "UserInfoCtrller.h"
#import "ParallaxHeaderView.h"
#import "ParallaxHeaderView.h"
#import "UserInfoView.h"
#import "UserFoucusHeaderView.h"
#import "UserNotesCollectionTableViewCell.h"


@interface UserInfoCtrller () <UITableViewDelegate,UITableViewDataSource>
// UI
@property (weak, nonatomic) IBOutlet UITableView    *table;
@property (nonatomic,strong) ParallaxHeaderView     *paralax ;
@property (nonatomic,strong) UserInfoView           *userinfoView ;

@end

@implementation UserInfoCtrller

#pragma mark - prop
- (void)setUserNameDisplay:(NSString *)userNameDisplay
{
    _userNameDisplay = userNameDisplay ;
    
    self.title = userNameDisplay ;
}


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
    [self configureUI] ;
}

- (void)viewDidAppear:(BOOL)animated
{
    [(ParallaxHeaderView *)self.table.tableHeaderView refreshBlurViewForNewImage] ;
    [super viewDidAppear:animated];
}

- (void)configureUI
{
    _table.delegate = self ;
    _table.dataSource = self ;
    _table.separatorStyle = 0 ;
    [_table registerNib:[UINib nibWithNibName:idUserNotesCollectionTableViewCell bundle:nil] forCellReuseIdentifier:idUserNotesCollectionTableViewCell] ;
    [_table registerNib:[UINib nibWithNibName:idUserFoucusHeaderView bundle:nil] forHeaderFooterViewReuseIdentifier:idUserFoucusHeaderView] ;
    
    self.paralax = ({
        ParallaxHeaderView *header = [ParallaxHeaderView parallaxHeaderViewWithSubView:self.userinfoView] ;
        header ;
    }) ;
    
    [_table setTableHeaderView:self.paralax] ;
}


//#pragma mark - RootTableViewDelegate
//- (void)loadNewData
//{
//
//}
//
//- (void)loadMoreData
//{
//    
//}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserNotesCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idUserNotesCollectionTableViewCell] ;
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:idUserNotesCollectionTableViewCell] ;
    }
    return cell ;
}

// custom view for header. will be adjusted to default or specified header height
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UserFoucusHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:idUserFoucusHeaderView] ;
    return header ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UserNotesCollectionTableViewCell getHeightWithCount:10] ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40. ;
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
