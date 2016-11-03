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
#import "NoteDetailCtrller.h"

static const int kHowmany = 20 ;

// UI
@interface UserInfoCtrller () <UITableViewDelegate,UITableViewDataSource,RootTableViewDelegate,HPBigPhotoHeaderViewDelegate,UserNotesCollectionTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet RootTableView    *table ;
@property (nonatomic,strong) ParallaxHeaderView     *paralax ;
@property (nonatomic,strong) UserInfoView           *userinfoView ;
@end

// code
@interface UserInfoCtrller ()
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
                       currentUserID:[UserOnDevice currentUserOnDevice].userId
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
                            currentUser:[UserOnDevice currentUserOnDevice].userId
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
                            currentUser:[UserOnDevice currentUserOnDevice].userId
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
    cell.delegate = self ;
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



#pragma mark --
#pragma mark - UserNotesCollectionTableViewCellDelegate <HomePageCollectionCellDelegate>
- (void)noteSelected:(NoteListViewItem *)note
{
    NoteDetailCtrller *detailCtrller = (NoteDetailCtrller *)[[self class] getCtrllerFromStory:@"HomePage" controllerIdentifier:@"NoteDetailCtrller"] ;
    NSString *articleIDWillSend = nil ;
    articleIDWillSend = note.articleId ;

    detailCtrller.articleId = articleIDWillSend ;
    detailCtrller.blockFocus = ^(NSString *userID, BOOL bFocus){
        [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
            if ([noteItem.ownerId isEqualToString:userID]) {
                noteItem.isFollow = bFocus ; // 关注
            }
        }] ;
        
        [_table reloadData] ;
        
    } ;
    detailCtrller.blockUpvote = ^(NSString *noteID, BOOL bUpvote){
        [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
            if ([noteItem.articleId isEqualToString:noteID]) {
                noteItem.isUpvote = bUpvote ; // 点赞
                noteItem.upvoteCnt = bUpvote ? ++noteItem.upvoteCnt : --noteItem.upvoteCnt ; // 点赞数
                *stop = YES ;
            }
        }] ;
        [_table reloadData] ;
    } ;
    
    detailCtrller.blockFavorite = ^(NSString *noteID, BOOL bFavorite){
        [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
            if ([noteItem.articleId isEqualToString:noteID]) {
                noteItem.isFavorite = bFavorite ; // 收藏
                *stop = YES ;
            }
        }] ;
        [_table reloadData] ;
    } ;
    
    [self.navigationController pushViewController:detailCtrller animated:YES] ;
}

- (BOOL)likeNoteID:(NSString *)noteID addOrRemove:(bool)addOrRemove
{
    BOOL hasLogin = [UserOnDevice checkForLoginOrNot:self] ;
    if (!hasLogin) return false;
    
    if (addOrRemove)
    {
        [ServerRequest addLikeWithID:noteID
                               token:[UserOnDevice token]
                             success:^(id json) {
                                 [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                                             NSUInteger idx,
                                                                             BOOL * _Nonnull stop) {
                                     if ([noteItem.articleId isEqualToString:noteID])
                                     {
                                         noteItem.isUpvote = true ;
                                         *stop = true ;
                                     }
                                 }] ;
                                 
                             } fail:^{
                                 
                             }] ;
    }
    else
    {
        [ServerRequest removeLikeWithID:noteID
                                  token:[UserOnDevice token]
                                success:^(id json) {
                                    [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                                                NSUInteger idx,
                                                                                BOOL * _Nonnull stop) {
                                        if ([noteItem.articleId isEqualToString:noteID])
                                        {
                                            noteItem.isUpvote = false ;
                                            *stop = true ;
                                        }
                                    }] ;
                                } fail:^{
                                    
                                }] ;
    }
    return true ;
}

- (BOOL)collectNoteID:(NSString *)noteID addOrRemove:(bool)addOrRemove
{
    BOOL hasLogin = [UserOnDevice checkForLoginOrNot:self] ;
    if (!hasLogin) return false;
    
    if (addOrRemove) {
        [ServerRequest addFavoriteWithID:noteID
                                 success:^(id json) {
                                     [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                                                 NSUInteger idx,
                                                                                 BOOL * _Nonnull stop) {
                                         if ([noteItem.articleId isEqualToString:noteID])
                                         {
                                             noteItem.isFavorite = true ;
                                             *stop = true ;
                                         }
                                     }] ;
                                 } fail:^{
                                     
                                 }] ;
    }
    else {
        [ServerRequest removeFavoriteWithID:noteID
                                    success:^(id json) {
                                        [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                                                    NSUInteger idx,
                                                                                    BOOL * _Nonnull stop) {
                                            if ([noteItem.articleId isEqualToString:noteID])
                                            {
                                                noteItem.isFavorite = false ;
                                                *stop = true ;
                                            }
                                        }] ;
                                    } fail:^{
                                        
                                    }] ;
    }
    return true ;
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
