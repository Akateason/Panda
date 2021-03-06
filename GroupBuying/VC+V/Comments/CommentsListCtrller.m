//
//  CommentsListCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/10/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "CommentsListCtrller.h"
#import "CommentCell.h"
#import "Comment.h"
#import "CommentsPostCtrller.h"
#import "UserInfoCtrller.h"
#import "UserOnDevice.h"
#import "NotificationCenterHeader.h"


static const NSInteger kHowmany = 20 ;


@interface CommentsListCtrller () <UITableViewDelegate,UITableViewDataSource,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet RootTableView *table;
@property (weak, nonatomic) IBOutlet UIControl *btBg;
@property (weak, nonatomic) IBOutlet UIView *CmtbgContainer;
@property (weak, nonatomic) IBOutlet UILabel *lb_saySth;

@property (nonatomic,strong) NSArray *listComments ;

@end

@implementation CommentsListCtrller


#pragma mark - util
- (void)addCommentCallback:(NSNotification *)notification
{
    Comment *comment = notification.object ;
    NSMutableArray *tmplist = [self.listComments mutableCopy] ;
    [tmplist insertObject:comment atIndex:0] ;
    self.listComments = tmplist ;
    [_table reloadData] ;
}


#pragma mark - action
- (IBAction)btCommentOnClick:(id)sender
{
    if (![UserOnDevice checkForLoginOrNot:self]) return ;
    
    NSLog(@"发布评论") ;
    CommentsPostCtrller *postCmtVC = (CommentsPostCtrller *)[[self class] getCtrllerFromStory:@"HomePage" controllerIdentifier:@"CommentsPostCtrller"] ;
    postCmtVC.objectID = self.articleId ;
    [self.navigationController pushViewController:postCmtVC animated:YES] ;
}



#pragma mark - life
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_COMMENT_ADD_COMPLETE object:nil] ;
}

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    [self configureUIs] ;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(addCommentCallback:)
                                                 name:NOTIFICATION_COMMENT_ADD_COMPLETE
                                               object:nil] ;
}

- (void)configureUIs
{
    self.title = @"评论" ;
    
    _btBg.backgroundColor = [UIColor xt_seperate] ;
    _lb_saySth.textColor = [UIColor xt_w_desc2] ;
    _CmtbgContainer.layer.cornerRadius = 5. ;
    
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.separatorStyle = 0 ;
    _table.xt_Delegate = self ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    [_table registerNib:[UINib nibWithNibName:kID_CommentCell bundle:nil] forCellReuseIdentifier:kID_CommentCell] ;
}


#pragma mark - RootTableViewDelegate
- (void)loadNewData
{
    [ServerRequest getCommentsListByObjectId:self.articleId
                                        From:0
                                     howmany:kHowmany
                                     refresh:1
                                     success:^(id json) {
                                         
                                         NSMutableArray *tmplist = [@[] mutableCopy] ;
                                         ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                         if (result.code == 1) {
                                             NSArray *comments = result.data[@"commentList"] ;
                                             for (NSDictionary *dic in comments) {
                                                 Comment *cmt = [Comment yy_modelWithJSON:dic] ;
                                                 [tmplist addObject:cmt] ;
                                             }
                                             self.listComments = tmplist ;
                                             
                                             [_table reloadData] ;
                                         }
                                         
                                     } fail:^{
                                         
                                     }] ;
}

- (void)loadMoreData
{
    [ServerRequest getCommentsListByObjectId:self.articleId
                                        From:(int)self.listComments.count
                                     howmany:kHowmany
                                     refresh:0
                                     success:^(id json) {
                                         
                                         NSMutableArray *tmplist = [self.listComments mutableCopy] ;
                                         ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                         if (result.code == 1) {
                                             NSArray *comments = result.data[@"commentList"] ;
                                             for (NSDictionary *dic in comments) {
                                                 Comment *cmt = [Comment yy_modelWithJSON:dic] ;
                                                 [tmplist addObject:cmt] ;
                                             }
                                             self.listComments = tmplist ;
                                             
                                             [_table reloadData] ;
                                         }

                                     } fail:^{
                                         
                                     }] ;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CommentCell calculateHeight:self.listComments[indexPath.row]] ;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listComments.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_CommentCell] ;
    Comment *aCmt = self.listComments[indexPath.row] ;
    cell.aComment = aCmt ;
    cell.blockTapHead = ^(NSString *createrID) {
        UserInfoCtrller *userCtrl = (UserInfoCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"UserInfoCtrller"] ;
        userCtrl.userID = createrID ;
        [self.navigationController pushViewController:userCtrl animated:YES] ;
    } ;
    cell.blockReply = ^(NSString *replyToWho) {
        NSLog(@"回复评论") ;
        if (![UserOnDevice checkForLoginOrNot:self]) return ;
        
        if ([aCmt.createrId isEqualToString:[UserOnDevice currentUserOnDevice].userId]) return ; // 自己不能回复自己
        
        CommentsPostCtrller *postCmtVC = (CommentsPostCtrller *)[[self class] getCtrllerFromStory:@"HomePage" controllerIdentifier:@"CommentsPostCtrller"] ;
        postCmtVC.objectID = self.articleId ;
        postCmtVC.strReplyToWho = replyToWho ;
        [self.navigationController pushViewController:postCmtVC animated:YES] ;
    } ;
    return cell ;
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
