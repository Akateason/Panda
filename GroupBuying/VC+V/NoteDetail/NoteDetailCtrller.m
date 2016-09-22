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
#import "YYModel.h"
#import "DetailUserInfoView.h"
#import "DetailCoverTitleCell.h"
#import "DetailTagsCell.h"
#import "Article.h"
#import "DetailCommentsCell.h"
#import "DetailHisFocusCell.h"
#import "DetailRecommend Cell.h"
#import "TagDetailCtrller.h"

@interface NoteDetailCtrller () <UITableViewDataSource,UITableViewDelegate,RootTableViewDelegate>
{
    BOOL bFirstTime ;
}
// storyboard
@property (weak, nonatomic) IBOutlet UIView *bottomBar;
@property (weak, nonatomic) IBOutlet RootTableView *table;
@property (weak, nonatomic) IBOutlet UIAlternativeButton *bt_coupon;
@property (weak, nonatomic) IBOutlet UIAlternativeButton *btLike;
@property (weak, nonatomic) IBOutlet UIAlternativeButton *btComment;
@property (weak, nonatomic) IBOutlet UIAlternativeButton *btCollecion;

// data
@property (nonatomic,strong) NoteDetailViewItem *noteDetail ;

@end

@implementation NoteDetailCtrller


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
//    [_bt_coupon setBackgroundImage:btBgImage forState:UIControlStateHighlighted] ;
//    [_btLike setBackgroundImage:btBgImage forState:UIControlStateHighlighted] ;
//    [_btComment setBackgroundImage:btBgImage forState:UIControlStateHighlighted] ;
    [_btCollecion setBackgroundImage:btBgImageRed forState:UIControlStateNormal] ;
    [_btCollecion setBackgroundImage:btBgImageWhite forState:UIControlStateSelected] ;
    
}

- (void)configureTable
{
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
}


#pragma mark - bottom bar actions
- (IBAction)btCouponOnClick:(id)sender {
    NSLog(@"优惠券") ;
}

- (IBAction)btLikeOnClick:(UIAlternativeButton *)button {
    button.selected = !button.selected ;
}

- (IBAction)btCommentOnClick:(id)sender {
    NSLog(@"评论") ;
}

- (IBAction)btCollectionOnClick:(UIAlternativeButton *)button {
    button.selected = !button.selected ;
}



#pragma mark - life
- (void)viewDidLoad
{
    bFirstTime = YES ;
    self.title = @"笔记详情" ;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureUIs] ;
    [self configureTable] ;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated] ;
    _bottomBar.hidden = NO ;
}



#pragma mark - RootTableViewDelegate
- (void)loadNewData
{
    NSString *userID = [UserOnDevice currentUserOnDevice].idOwn ;

    [ServerRequest articleDetailWithArticleID:self.articleId
                                      refresh:@(bFirstTime)
                                       userID:userID
                                      success:^(id json) {
                                          ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                          if (result.code == 1) {
                                              id jsonobj = result.data[@"noteDetail"] ;
                                              NoteDetailViewItem *detailItem = [NoteDetailViewItem yy_modelWithJSON:jsonobj] ;
                                              self.noteDetail = detailItem ;
                                              
                                              [_table reloadData] ;
                                          }
                                      }
                                         fail:^{
                                             
                                         }] ;
    bFirstTime = NO ;
}

- (void)loadMoreData
{
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        if (!self.noteDetail.articleInfo.tags.count) {
            return 0 ; // 无标签. 不显示
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
        return cell ;
    }
    else if (section == 3) {
        DetailHisFocusCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_DetailHisFocusCell] ;
        
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
