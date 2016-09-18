//
//  PostCtrller.m
//  GroupBuying
//
//  Created by teason on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PostCtrller.h"
#import "PostContentCell.h"
#import "PostPhotosCell.h"
#import "CameraViewController.h"
#import "PostTagCell.h"
#import "Article.h"
#import "Resource.h"
#import "Pic.h"
#import "YYModel.h"
#import "SVProgressHUD.h"
#import "ArticlePicItem.h"
#import "ArticlePicItemInfo.h"
#import "TagSearchingCtrller.h"
#import "NotificationCenterHeader.h"
#import "UserOnDevice.h"


static NSString *const kType = @"NOTE" ;

@interface PostCtrller () <UITableViewDelegate,UITableViewDataSource,PostPhotosCellDelegate,PostTagCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;

@property (nonatomic,strong) NSArray *articleTaglist ; // tags in article .

@end

@implementation PostCtrller

#pragma mark - PostTagCellDelegate <NSObject>
- (void)addTag
{
    NSLog(@"添加 文章标签") ;
    [self performSegueWithIdentifier:@"post2tagSearch" sender:nil] ;
}

- (void)saveDraft
{
    NSLog(@"保存草稿") ;
}

#pragma mark - PostPhotosCellDelegate
- (void)addPhoto
{
    NSLog(@"再添加图片") ;
    CameraViewController *cameraVC = (CameraViewController *)[[self class] getCtrllerFromStory:@"Camera" controllerIdentifier:@"CameraViewController"] ;
    cameraVC.openType = typeEdit ;
    cameraVC.existedSubArticleCount = (int)self.photoList.count ;
    cameraVC.postCtrl = self ;
    [self.navigationController pushViewController:cameraVC animated:YES] ;
}

- (void)deletePhotoWithList:(NSArray *)list index:(NSInteger)indexDelete
{
    self.photoList = list ;
    
    NSMutableArray *tmplist = [self.photoTagList mutableCopy];
    [tmplist removeObjectAtIndex:indexDelete] ;
    self.photoTagList = tmplist ;
}




#pragma mark - Action

- (IBAction)btPostOnClick:(id)sender
{
    // login
    User *user = [UserOnDevice currentUserOnDevice] ;
    if (!user) {
        [SVProgressHUD showErrorWithStatus:@"您还未登录哦"] ;
        return ;
    }
    
    NSLog(@"发布笔记") ;
    [SVProgressHUD showWithStatus:@"正在上传..."] ;
    PostContentCell *contentCell = [_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] ;
    NSString *title = [contentCell fetchTitleStr] ;
    NSString *content = [contentCell fetchContentStr] ;
    if (!title.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入标题"] ;
        return ;
    } else if (!content.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入内容文字"] ;
        return ;
    } else if (!self.photoList.count) {
        [SVProgressHUD showErrorWithStatus:@"请添加图片"] ;
        return ;
    }
    
    
// batch upload photos .
    __block BOOL bUploadFail = false ;
    // 准备保存结果的数组,先用 NSNull 占位 , 保证最后顺序
    NSMutableArray* result = [NSMutableArray array];
    for (int i = 0 ; i < self.photoList.count ; i++) {
        [result addObject:[NSNull null]] ;
    }
    dispatch_group_t group = dispatch_group_create();
    for (NSInteger i = 0; i < self.photoList.count; i++)
    {
        dispatch_group_enter(group);
        NSURLSessionUploadTask* uploadTask = [ServerRequest uploadTaskWithImage:self.photoList[i]
                                                                     completion:^(NSURLResponse *response, NSDictionary* responseObject, NSError *error)
        {
            if (error) {
                bUploadFail = YES ;
                NSLog(@"第 %d 张图片上传失败: %@", (int)i + 1, error);
                dispatch_group_leave(group);
            } else {
                NSLog(@"第 %d 张图片上传成功", (int)i + 1);
                @synchronized (result) { // NSMutableArray 是线程不安全的，所以加个同步锁
                    result[i] = responseObject;
                }
                dispatch_group_leave(group);
            }
        }];
        [uploadTask resume];
    }
    
    // notify .
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if (bUploadFail) {
            NSLog(@"上传失败!");
            [SVProgressHUD dismiss] ;
            [SVProgressHUD showErrorWithStatus:@"图片上传失败"] ;
            return ;
        }
        NSLog(@"图片上传完成!");
        NSMutableArray *articlePicItemList = [@[] mutableCopy] ;
        int idx = 0 ;
        for (NSDictionary *response in result)
        {
            Resource *resource = [Resource yy_modelWithDictionary:response[@"data"][@"resource"]] ;
            Pic *aPic = [[Pic alloc] initWithResource:resource] ;
            NSArray *tagItemList = nil ;
            if ([self.photoTagList[idx] isKindOfClass:[NSArray class]]) {
                tagItemList = self.photoTagList[idx] ;
            }
            ArticlePicItem *picItem = [[ArticlePicItem alloc] initWillUploadWithPic:aPic
                                                                              items:tagItemList] ;
            [articlePicItemList addObject:picItem] ;
            idx++ ;
        }
                        
        
        // article .
        Article *articleWillUpload = [[Article alloc] initArticleWillPostWithTitle:title
                                                                          picItems:articlePicItemList
                                                                           content:content
                                                                              type:@"NOTE"
                                                                              tags:self.articleTaglist
                                                                            status:@"PUBLISH"] ;
        
        [ServerRequest addArticle:articleWillUpload
                          success:^(id json)
        {
            [SVProgressHUD dismiss] ;
            ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
            if (result.code != 1) {
                NSLog(@"文章发布失败") ;
                [SVProgressHUD dismiss] ;
                [SVProgressHUD showErrorWithStatus:@"提交失败,网络状态不佳"] ;
                return ;
            }
            
            // success .
            NSLog(@"文章发布成功") ;
            [self dismissViewControllerAnimated:YES completion:^{}] ;
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_POST_ARTICLE_COMPLETE object:nil] ;
            
        }
                             fail:^
        {
            NSLog(@"文章发布失败") ;
            [SVProgressHUD dismiss] ;
            [SVProgressHUD showErrorWithStatus:@"提交失败,网络状态不佳"] ;
                          }] ;
        
    });
    
}

- (IBAction)btCancelOnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil] ;
}








#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    _table.separatorStyle = 0 ;
    _table.delegate = self ;
    _table.dataSource = self ;
    [_table registerNib:[UINib nibWithNibName:idPostContentCell bundle:nil] forCellReuseIdentifier:idPostContentCell] ;
    [_table registerNib:[UINib nibWithNibName:idPostPhotosCell bundle:nil] forCellReuseIdentifier:idPostPhotosCell] ;
    [_table registerNib:[UINib nibWithNibName:idPostTagCell bundle:nil] forCellReuseIdentifier:idPostTagCell] ;
//    _btPost.backgroundColor = [UIColor xt_tabbarRedColor] ;
    
    self.articleTaglist = @[] ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO] ;
    [self.navigationController setNavigationBarHidden:NO] ;
    
    [_table reloadData] ;
}







#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        PostContentCell *cell = [tableView dequeueReusableCellWithIdentifier:idPostContentCell] ;
        return cell ;
    }
    else if (indexPath.row == 1) {
        PostPhotosCell *cell = [tableView dequeueReusableCellWithIdentifier:idPostPhotosCell] ;
        cell.listPhotos = self.photoList ;
        cell.delegate = self ;
        return cell ;
    }
    else if (indexPath.row == 2) {
        PostTagCell *cell = [tableView dequeueReusableCellWithIdentifier:idPostTagCell] ;
        cell.delegate = self ;
        cell.listTags = self.articleTaglist ;
        cell.closeTagBlock = ^(NSInteger indexRemove) {
            NSMutableArray *tmplist = [self.articleTaglist mutableCopy];
            [tmplist removeObjectAtIndex:indexRemove] ;
            self.articleTaglist = tmplist ;
            [_table reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0]]
                          withRowAnimation:UITableViewRowAnimationNone] ;
        } ;
        return cell ;
    }
    
    return nil ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 194. ;
    }
    else if (indexPath.row == 1) {
        return 100. ;
    }
    else if (indexPath.row == 2) {
        return APP_HEIGHT - 194. - 100. + 130. ;
    }
    
    return 0 ;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.table reloadData] ;
}




#pragma mark - Navigation
 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"post2tagSearch"])
    {
        TagSearchingCtrller *tagSearchVC = [segue destinationViewController] ;
        tagSearchVC.block = ^(NSString *tagCallback) {
            NSMutableArray *tmplist = [self.articleTaglist mutableCopy];
            [tmplist addObject:tagCallback] ;
            self.articleTaglist = tmplist ;
            [_table reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0]]
                          withRowAnimation:UITableViewRowAnimationNone] ;
        } ;
    }
    
}



@end
