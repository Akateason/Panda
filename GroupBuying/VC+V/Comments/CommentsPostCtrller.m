//
//  CommentsPostCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/10/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "CommentsPostCtrller.h"
#import "Comment.h"
#import "UserOnDevice.h"

@interface CommentsPostCtrller () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *seperateLine;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *lbPlaceholder;

@end

@implementation CommentsPostCtrller

#pragma mark - action
- (void)btPostCommentOnClick
{
    Comment *aComment = [[Comment alloc] init] ;
    aComment.content = self.textView.text ;
    aComment.createrId = [UserOnDevice currentUserOnDevice].userId ;
    aComment.createName = [UserOnDevice currentUserOnDevice].nickName ;
    aComment.objectType = @"NOTE" ;
    aComment.objectId = self.objectID ;
    
    [ServerRequest addComment:aComment
                      success:^(id json) {
                          
                          ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                          if (result.code == 1) {
                              NSDictionary *dic = result.data[@"comment"] ;
                              Comment *commentUploaded = [Comment yy_modelWithJSON:dic] ;
                              NSLog(@"get comment and pop %@",commentUploaded) ;
                          }
                          
                      } fail:^{
                          
                      }] ;
}

#pragma mark - prop
- (void)setStrReplyToWho:(NSString *)strReplyToWho
{
    _strReplyToWho = strReplyToWho ;
    
    if (strReplyToWho != nil && strReplyToWho.length > 0) {
        self.lbPlaceholder.text = [NSString stringWithFormat:@"回复%@ : ",strReplyToWho] ;
    }
}

#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"评论" ;
    
    _textView.textColor = [UIColor xt_w_dark] ;
    _textView.delegate = self ;
    _textView.scrollEnabled = NO ;
    
    _seperateLine.backgroundColor = [UIColor xt_seperate] ;
    _lbPlaceholder.textColor = [UIColor xt_w_light] ;
    
    
    UIButton *btPost = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)] ;
    [btPost setTitle:@"发布" forState:0] ;
    [btPost setTitleColor:[UIColor xt_tabbarRedColor] forState:0] ;
    [btPost addTarget:self action:@selector(btPostCommentOnClick) forControlEvents:UIControlEventTouchUpInside] ;
    UIBarButtonItem *postItem = [[UIBarButtonItem alloc] initWithCustomView:btPost] ;
    self.navigationItem.rightBarButtonItem = postItem ;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        _lbPlaceholder.hidden = NO ;
    }else{
        _lbPlaceholder.hidden = YES ;
    }
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
