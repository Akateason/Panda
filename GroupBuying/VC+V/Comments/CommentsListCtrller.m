//
//  CommentsListCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/10/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "CommentsListCtrller.h"
#import "CommentCell.h"

@interface CommentsListCtrller () <UITableViewDelegate,UITableViewDataSource,RootTableViewDelegate>

@property (weak, nonatomic) IBOutlet RootTableView *table;

@property (weak, nonatomic) IBOutlet UIControl *btBg;
@property (weak, nonatomic) IBOutlet UIView *CmtbgContainer;
@property (weak, nonatomic) IBOutlet UILabel *lb_saySth;

@end

@implementation CommentsListCtrller

#pragma mark - action
- (IBAction)btCommentOnClick:(id)sender
{
    NSLog(@"发布评论") ;
}



#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    //
    [self configureUIs] ;
}

- (void)configureUIs
{
    _btBg.backgroundColor = [UIColor xt_seperate] ;
    _lb_saySth.textColor = [UIColor xt_w_desc2] ;
    _CmtbgContainer.layer.cornerRadius = 5. ;
    
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.xt_Delegate = self ;
    [_table registerNib:[UINib nibWithNibName:kID_CommentCell bundle:nil] forCellReuseIdentifier:kID_CommentCell] ;
    
}


#pragma mark - RootTableViewDelegate
- (void)loadNewData
{
    [ServerRequest getCommentsListByObjectId:self.articleId
                                        From:<#(int)#>
                                     howmany:<#(int)#>
                                     refresh:<#(int)#>
                                     success:^(id json) {
                                         <#code#>
                                     } fail:^{
                                         <#code#>
                                     }] ;
}

- (void)loadMoreData
{
    
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 94 ; /// fake
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
