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
#import "UserOnDevice.h"
#import "UserViewItem.h"
#import "MyFansFocusCtrller.h"
#import "BigPhotoHeaderViewProtocolHeader.h"
#import "FocusHandler.h"
#import "NoteListViewItem.h"


static const int kHowmany = 20 ;

@interface UserInfoCtrller () <UITableViewDelegate,UITableViewDataSource,RootTableViewDelegate,HPBigPhotoHeaderViewDelegate>
{
    NSString *currentUserID ;
}

// UI
@property (weak, nonatomic) IBOutlet RootTableView    *table ;
@property (nonatomic,strong) ParallaxHeaderView     *paralax ;
@property (nonatomic,strong) UserInfoView           *userinfoView ;
// code
@property (nonatomic,strong) UserViewItem           *userItem ;
@property (nonatomic,strong) NSArray                *listNote ;
@end

@implementation UserInfoCtrller

#pragma mark - HPBigPhotoHeaderViewDelegate
- (BOOL)followUserBtOnClickWithCreaterID:(NSString *)createrID
                                followed:(BOOL)bFollow
{
    BOOL hasLogin = [UserOnDevice checkForLoginOrNot:self] ;
    if (!hasLogin) return false ;
    
    if (bFollow) {
        [FocusHandler addFocus:createrID complete:^(ResultParsered *result) {
            if (result.code == 1) {
                self.userItem.isFollow = bFollow ;
                [_table reloadData] ;
            }
        }] ;
    }
    else {
        [FocusHandler cancelFocus:createrID complete:^(ResultParsered *result) {
            if (result.code == 1) {
                self.userItem.isFollow = bFollow ;
                [_table reloadData] ;
            }
        }] ;
    }
    
    return true ;
}


#pragma mark - prop
- (void)setUserID:(NSString *)userID
{
    _userID = userID ;
    
    if (!userID) return ;
    
    // get user
    [ServerRequest getUserSearchByID:userID
                       currentUserID:currentUserID
                             success:^(id json) {
                                 ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                 if (result.code == 1) {
                                     self.userItem = [UserViewItem yy_modelWithJSON:result.data[@"userView"]] ;
                                     if (self.title.length == 0) self.title = self.userItem.userInfo.nickName ;
                                     self.userinfoView.aUser = self.userItem.userInfo ;
                                     [_table reloadData] ;
                                 }
                             }
                                fail:^{
                                }] ;
    
    // get noteitems from user .
    [ServerRequest searchNoteListByUser:self.userID
                                refresh:1
                            currentUser:currentUserID
                                   from:0
                                howmany:kHowmany
                                success:^(id json) {
                                    
                                    ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                    if (result.code == 1) {
                                        NSMutableArray *tmplist = [self.listNote mutableCopy] ;
                                        NSArray *diclist = result.data[@"noteList"] ;
                                        for (NSDictionary *dic in diclist) {
                                            NoteListViewItem *item = [NoteListViewItem yy_modelWithJSON:dic] ;
                                            [tmplist addObject:item] ;
                                        }
                                        self.listNote = tmplist ;
                                        if (tmplist.count > 0) {
                                            [_table reloadData] ;
                                        }
                                    }
                                }
                                   fail:^{
                                   }] ;
}


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

- (NSArray *)listNote
{
    if (!_listNote) {
        _listNote = @[] ;
    }
    return _listNote ;
}


#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    currentUserID = [UserOnDevice currentUserOnDevice].userId ;
    
    
    __weak UserInfoCtrller *weakSelf = self ;
    self.userinfoView.hisFocus = ^{
        MyFansFocusCtrller *mffVC = (MyFansFocusCtrller *)[[MyFansFocusCtrller class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MyFansFocusCtrller"] ;
        mffVC.displayType = type_focus ;
        mffVC.userID = weakSelf.userID ;
        [weakSelf.navigationController pushViewController:mffVC animated:YES] ;
    } ;
    self.userinfoView.hisFans = ^{
        MyFansFocusCtrller *mffVC = (MyFansFocusCtrller *)[[MyFansFocusCtrller class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MyFansFocusCtrller"] ;
        mffVC.displayType = type_fans ;
        mffVC.userID = weakSelf.userID ;
        [weakSelf.navigationController pushViewController:mffVC animated:YES] ;
    } ;
    
    [self configureUI] ;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [(ParallaxHeaderView *)self.table.tableHeaderView refreshBlurViewForNewImage] ;
}

- (void)configureUI
{
    [_table registerNib:[UINib nibWithNibName:idUserNotesCollectionTableViewCell bundle:nil] forCellReuseIdentifier:idUserNotesCollectionTableViewCell] ;
    [_table registerNib:[UINib nibWithNibName:idUserFoucusHeaderView bundle:nil] forHeaderFooterViewReuseIdentifier:idUserFoucusHeaderView] ;
    _table.delegate = self ;
    _table.dataSource = self ;
    _table.xt_Delegate = self ;
    _table.separatorStyle = 0 ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    [_table cancelHeaderRefreshUI] ;
    
    self.paralax = ({
        ParallaxHeaderView *header = [ParallaxHeaderView parallaxHeaderViewWithSubView:self.userinfoView] ;
        header ;
    }) ;
    
    [_table setTableHeaderView:self.paralax] ;
}

#pragma mark - RootTableViewDelegate
//- (void)loadNewData
//{
//    
//}

- (void)loadMoreData
{
    [ServerRequest searchNoteListByUser:self.userID
                                refresh:0
                            currentUser:currentUserID
                                   from:(int)self.listNote.count
                                howmany:kHowmany
                                success:^(id json) {
                                    
                                    ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                    if (result.code == 1) {
                                        NSMutableArray *tmplist = [self.listNote mutableCopy] ;
                                        NSArray *diclist = result.data[@"noteList"] ;
                                        for (NSDictionary *dic in diclist) {
                                            NoteListViewItem *item = [NoteListViewItem yy_modelWithJSON:dic] ;
                                            [tmplist addObject:item] ;
                                        }
                                        self.listNote = tmplist ;
                                        [_table reloadData] ;
                                    }
                                }
                                   fail:^{
                                   }] ;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserNotesCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idUserNotesCollectionTableViewCell] ;
    cell.noteItems = self.listNote ;
    return cell ;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UserFoucusHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:idUserFoucusHeaderView] ;
    header.delegate = self;
    header.userItem = self.userItem ;
    return header ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UserNotesCollectionTableViewCell getHeightWithCount:self.listNote.count] ;
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
