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

@interface PostCtrller () <UITableViewDelegate,UITableViewDataSource,PostPhotosCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation PostCtrller

#pragma mark - PostPhotosCellDelegate
- (void)addPhoto
{
    CameraViewController *cameraVC = (CameraViewController *)[[self class] getCtrllerFromStory:@"Camera" controllerIdentifier:@"CameraViewController"] ;
    cameraVC.openType = typeEdit ;
    cameraVC.existedSubArticleCount = (int)self.photoList.count ;
    cameraVC.postCtrl = self ;
    
    [self.navigationController pushViewController:cameraVC animated:YES] ;
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
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
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
        return 130. ;
    }
    
    return 0 ;
}








@end
