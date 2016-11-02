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
#import "NoteDetailViewItem.h"
#import "UserOnDevice.h"
#import "DetailUserInfoView.h"
#import "DetailCoverTitleCell.h"
#import "DetailTagsCell.h"
#import "Article.h"
#import "DetailCommentsCell.h"
#import "DetailHisFocusCell.h"
#import "DetailRecommend Cell.h"
#import "TagDetailCtrller.h"
#import "UserInfoCtrller.h"
#import "CommentsListCtrller.h"
#import "FocusHandler.h"
#import "MyFansFocusCtrller.h"
#import "NotificationCenterHeader.h"

@interface NoteDetailCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate,HPBigPhotoHeaderViewDelegate,DetailCommentsCellDelegate>
// storyboard
@property (weak, nonatomic) IBOutlet UIView *bottomBar;
@property (weak, nonatomic) IBOutlet RootTableView *table;
@property (weak, nonatomic) IBOutlet UIAlternativeButton *bt_coupon;
@property (weak, nonatomic) IBOutlet UIAlternativeButton *btLike;
@property (weak, nonatomic) IBOutlet UIAlternativeButton *btComment;
@property (weak, nonatomic) IBOutlet UIAlternativeButton *btCollecion;
@end

@interface NoteDetailCtrller ()
// data
@property (nonatomic,strong) NoteDetailViewItem *noteDetail ;
@end



@implementation NoteDetailCtrller


#pragma mark - DetailCommentsCellDelegate <NSObject>
- (void)moreComments
{
    [self jump2CommentListVC] ;
}

- (void)clickCommentsUserHead:(NSString *)createrID
{
    UserInfoCtrller *userCtrl = (UserInfoCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"UserInfoCtrller"] ;
    userCtrl.userID = createrID ;
    [self.navigationController pushViewController:userCtrl animated:YES] ;
}



#pragma mark - HPBigPhotoHeaderViewDelegate
- (void)userheadOnClickWithUserID:(NSString *)userID userName:(NSString *)name
{
    UserInfoCtrller *userCtrl = (UserInfoCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"UserInfoCtrller"] ;
    userCtrl.userID = userID ;
    userCtrl.userNameDisplay = name ;
    [self.navigationController pushViewController:userCtrl animated:YES] ;
}

- (BOOL)followUserBtOnClickWithCreaterID:(NSString *)createrID followed:(BOOL)bFollow
{
    BOOL hasLogin = [UserOnDevice checkForLoginOrNot:self] ;
    if (!hasLogin) return false ;
    
    if (bFollow) {
        
        [FocusHandler addFocus:createrID
                      complete:^(ResultParsered *result) {
                          if (result.code == 1) {
                              self.noteDetail.isFollow = true ;
                          }
                      }] ;
    }
    else {
        
        [FocusHandler cancelFocus:createrID
                         complete:^(ResultParsered *result) {
                             if (result.code == 1) {
                                 self.noteDetail.isFollow = false ;
                             }
                         }] ;

    }
    
    self.blockFocus(createrID,bFollow) ;
    
    return true ;
}



#pragma mark - prop
- (void)setNoteDetail:(NoteDetailViewItem *)noteDetail
{
    _noteDetail = noteDetail ;
    
    if ([UserOnDevice hasLogin]) {
        _btLike.selected = noteDetail.isUpvote ;
        _btCollecion.selected = noteDetail.isFavorite ;
    }
    else {
        _btLike.selected = false ;
        _btCollecion.selected = false ;
    }
}




#pragma mark - life
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_COMMENT_ADD_COMPLETE object:nil] ;
}

- (void)viewDidLoad
{
    self.title = @"笔记详情" ;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureUIs] ;
    [self configureTable] ;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(addCommentCallback:)
                                                 name:NOTIFICATION_COMMENT_ADD_COMPLETE
                                               object:nil] ;
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
    
    UIImage *btBgImageRed = [UIImage imageWithColor:[UIColor xt_tabbarRedColor] size:_btLike.frame.size] ;
    UIImage *btBgImageWhite = [UIImage imageWithColor:[UIColor whiteColor] size:_btLike.frame.size] ;
    [_btCollecion setBackgroundImage:btBgImageRed forState:UIControlStateNormal] ;
    [_btCollecion setBackgroundImage:btBgImageWhite forState:UIControlStateSelected] ;
    
}

- (void)configureTable
{
    _table.backgroundColor = [UIColor xt_seperate] ;
    _table.delegate = self ;
    _table.dataSource = self ;
    _table.xt_Delegate = self ;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone ;
    [_table registerNib:[UINib nibWithNibName:kID_DetailUserInfoView bundle:nil] forHeaderFooterViewReuseIdentifier:kID_DetailUserInfoView] ;
    [_table registerNib:[UINib nibWithNibName:kID_DetailCoverTitleCell bundle:nil] forCellReuseIdentifier:kID_DetailCoverTitleCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_DetailTagsCell bundle:nil] forCellReuseIdentifier:kID_DetailTagsCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_DetailCommentsCell bundle:nil] forCellReuseIdentifier:kID_DetailCommentsCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_DetailHisFocusCell bundle:nil] forCellReuseIdentifier:kID_DetailHisFocusCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_DetailRecommend_Cell bundle:nil] forCellReuseIdentifier:kID_DetailRecommend_Cell] ;
    [_table cancelFooterRefreshUI] ;
}


#pragma mark - notification
- (void)addCommentCallback:(NSNotification *)notification
{
    Comment *comment = notification.object ;
    NSMutableArray *tmplist = [self.noteDetail.commentList mutableCopy] ;
    [tmplist insertObject:comment atIndex:0] ;
    self.noteDetail.commentList = tmplist ;
    [_table reloadData] ;
}




#pragma mark - bottom bar actions
- (IBAction)btCouponOnClick:(id)sender {
    NSLog(@"优惠券") ;
}

- (IBAction)btLikeOnClick:(UIAlternativeButton *)button
{
    BOOL hasLogin = [UserOnDevice checkForLoginOrNot:self] ;
    if (!hasLogin) return ;
    
    if (!button.selected)
    {
        [ServerRequest addLikeWithID:self.noteDetail.articleInfo.idArticle
                               token:[UserOnDevice token]
                             success:^(id json) {
                                self.noteDetail.isUpvote = true ;
                             } fail:^{
                                 
                             }] ;
    }
    else
    {
        [ServerRequest removeLikeWithID:self.noteDetail.articleInfo.idArticle
                                  token:[UserOnDevice token]
                                success:^(id json) {
                                    self.noteDetail.isUpvote = false ;
                                } fail:^{
                                    
                                }] ;
    }
    
    button.selected = !button.selected ;
    self.blockUpvote(self.noteDetail.articleInfo.idArticle,button.selected) ;
}

- (IBAction)btCommentOnClick:(id)sender
{
    NSLog(@"评论") ;
    [self jump2CommentListVC] ;
}

- (void)jump2CommentListVC
{
    CommentsListCtrller *commentListVC = (CommentsListCtrller *)[[self class] getCtrllerFromStory:@"HomePage" controllerIdentifier:@"CommentsListCtrller"] ;
    commentListVC.articleId = self.articleId ;
    [self.navigationController pushViewController:commentListVC animated:YES] ;
}

- (IBAction)btCollectionOnClick:(UIAlternativeButton *)button
{
    BOOL hasLogin = [UserOnDevice checkForLoginOrNot:self] ;
    if (!hasLogin) return ;
    
    if (!button.selected) {
        [ServerRequest addFavoriteWithID:self.noteDetail.articleInfo.idArticle
                                 success:^(id json) {
                                     self.noteDetail.isFavorite = true ;
                                 } fail:^{
                                     
                                 }] ;
    }
    else {
        [ServerRequest removeFavoriteWithID:self.noteDetail.articleInfo.idArticle
                                    success:^(id json) {
                                        self.noteDetail.isFavorite = false ;
                                    } fail:^{
                                        
                                    }] ;
    }
    
    button.selected = !button.selected ;
    self.blockFavorite(self.noteDetail.articleInfo.idArticle,button.selected) ;
}





#pragma mark - RootTableViewDelegate
- (void)loadNewData
{
    NSString *userID = [UserOnDevice currentUserOnDevice].userId ;

    [ServerRequest articleDetailWithArticleID:self.articleId
                                      refresh:@(1)
                                       userID:userID
                                      success:^(id json) {
                                          ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                          if (result.code == 1)
                                          {
                                              id jsonobj = result.data[@"noteDetail"] ;
                                              NoteDetailViewItem *detailItem = [NoteDetailViewItem yy_modelWithJSON:jsonobj] ;
                                              self.noteDetail = detailItem ;
                                              [_table reloadData] ;
                                          }
                                      }
                                         fail:^{
                                             
                                         }] ;

}

//- (void)loadMoreData
//{
//    
//}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.noteDetail == nil) {
        return 0 ; // error .
    }
    return 5 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        if (!self.noteDetail.articleInfo.tags.count) {
            return 0 ; // 无标签. 不显示
        }
    }
    else if (section == 3) {
        if (!self.noteDetail.followList.count) {
            return 0 ; // 无关注的人, 不显示
        }
    }
    return 1 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    if (section == 0) {
        DetailCoverTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_DetailCoverTitleCell] ;
        cell.noteItem = self.noteDetail ;
        return cell ;
    }
    else if (section == 1) {
        DetailTagsCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_DetailTagsCell] ;
        cell.tags = self.noteDetail.articleInfo.tags ;
        cell.clickTagBlock = ^(NSString *tagStr){
            if (!tagStr || !tagStr.length) return ;
            TagDetailCtrller *tagDetailVC = (TagDetailCtrller *)[[self class] getCtrllerFromStory:@"HomePage" controllerIdentifier:@"TagDetailCtrller"] ;
            tagDetailVC.tagStr = tagStr ;
            [self.navigationController pushViewController:tagDetailVC animated:YES] ;
        } ;
        return cell ;
    }
    else if (section == 2) {
        DetailCommentsCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_DetailCommentsCell] ;
        cell.comments = self.noteDetail.commentList ;
        cell.delegate = self ;
        return cell ;
    }
    else if (section == 3) {
        DetailHisFocusCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_DetailHisFocusCell] ;
        cell.listFollowers = self.noteDetail.followList ;
        cell.delegate = self ;
        cell.moreBtBlock = ^ {
            MyFansFocusCtrller *mffVC = (MyFansFocusCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MyFansFocusCtrller"] ;
            mffVC.displayType = type_focus ;
            mffVC.userID = [UserOnDevice currentUserOnDevice].userId ;
            [self.navigationController pushViewController:mffVC animated:YES] ;
        } ;
        return cell ;
    }
    else if (section == 4) {
        DetailRecommend_Cell *cell = [tableView dequeueReusableCellWithIdentifier:kID_DetailRecommend_Cell] ;
        
        return cell ;
    }
    return nil ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    if (section == 0) {
        return [DetailCoverTitleCell getHeightWithNoteItem:self.noteDetail] ;
    }
    else if (section == 1) {
        return [DetailTagsCell calculateHeight:self.noteDetail.articleInfo.tags] ;
    }
    else if (section == 2) {
        return [DetailCommentsCell calculateHeight:self.noteDetail.commentList] ;
    }
    else if (section == 3) {
        return kHeight_HisFocusCell ;
    }
    else if (section == 4) {
        return kHeight_DetailRecommend_Cell ;
    }

    return 0 ;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        DetailUserInfoView *headerUser = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kID_DetailUserInfoView] ;
        headerUser.note = self.noteDetail ;
        headerUser.delegate = self ;
        return headerUser ;
    }
    return nil ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 55. ;
    }
    return 0 ;
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
