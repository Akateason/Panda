//
//  CameraGoupCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/8/24.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "CameraGoupCtrller.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "CameraGroupCell.h"


@interface CameraGoupCtrller () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *groupList ;
@property (nonatomic,strong) UITableView *table ;

@end

@implementation CameraGoupCtrller

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init] ;
    if (self) {
        self.view.frame = frame ;
        [self table] ;
        [self setupGroups] ;

    }
    return self;
}

#pragma mark - life

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}

- (void)setupGroups
{
    // enumerate groups
    [self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop)
     {
         if (!group) return ;
         [self.groupList addObject:group] ;
         [_table reloadData] ;
         
     } failureBlock:^(NSError *error) {
         NSLog(@"Enumerate the asset groups failed.");
         [_table reloadData] ;
     }] ;
}



#pragma mark -
- (NSMutableArray *)groupList
{
    if (!_groupList) {
        _groupList = [@[] mutableCopy] ;
    }
    return _groupList ;
}

- (UITableView *)table
{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:self.view.bounds] ;
        _table.delegate = self ;
        _table.dataSource = self ;
        _table.separatorStyle = 0 ;
        [_table registerNib:[UINib nibWithNibName:identifierCameraGroupCell bundle:nil] forCellReuseIdentifier:identifierCameraGroupCell] ;
        if (!_table.superview) {
            [self.view addSubview:_table] ;
        }
    }
    return _table ;
}


#pragma mark --
#pragma mark - table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupList.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CameraGroupCell * cell = [tableView dequeueReusableCellWithIdentifier:identifierCameraGroupCell] ;
    if (!cell)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:identifierCameraGroupCell] ;
    }
    cell.group = self.groupList[indexPath.row] ;
    return cell ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78.0f ;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController popViewControllerAnimated:YES] ;
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectAlbumnGroup:)]) {
        [self.delegate selectAlbumnGroup:self.groupList[indexPath.row]] ;
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
