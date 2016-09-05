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

@interface PostCtrller () <UITableViewDelegate,UITableViewDataSource,PostPhotosCellDelegate,PostTagCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIButton *btPost;

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

- (void)deletePhotoWithList:(NSArray *)list
{
    self.photoList = list ;
}


#pragma mark - Action
- (IBAction)btPostOnClick:(id)sender
{
    NSLog(@"发布笔记") ;
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }] ;
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
    
    _btPost.backgroundColor = [UIColor xt_tabbarRedColor] ;
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
        cell.listTags = @[@1,@1,@1]; // for test .
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
//        return 130. ;
        return APP_HEIGHT - 194. - 100. + 130. ;
    }
    
    return 0 ;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.table reloadData] ;
}





@end
