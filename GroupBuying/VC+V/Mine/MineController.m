//
//  MineController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//  我的
// 不需要 tablerefresh .
// 定时器获取 新[消息].
// 缓存获取用户



#import "MineController.h"
#import "UserOnDevice.h"
#import "MineUserInfoCell.h"
#import "MineCell.h"
#import "AddFriendsCtrl.h"
#import "UserInfoCtrller.h"
#import "MyNoteCtrller.h"
#import "MyFansFocusCtrller.h"
#import "MessageCtrller.h"
#import "MyCollectionCtrller.h"
#import "ShopCartCtrller.h"
#import "SettingCtrller.h"
#import "MyCouponCodeCtrller.h"
#import "MyPointsCtrller.h"
#import "NotificationCenterHeader.h"

@interface MineController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;

@property (nonatomic,strong) NSMutableDictionary *dictionResource ;

@end

@implementation MineController

#pragma markk - action
- (IBAction)addFriendsOnClick:(id)sender
{
    NSLog(@"添加好友") ;
    AddFriendsCtrl *addfriendVC = (AddFriendsCtrl *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"AddFriendsCtrl"] ;
    [addfriendVC setHidesBottomBarWhenPushed:YES] ;
    [self.navigationController pushViewController:addfriendVC animated:YES] ;
}

- (IBAction)settingOnClick:(id)sender
{
    NSLog(@"设置") ;
    UINavigationController *settingNavVC = (UINavigationController *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"NavSetting"] ;
    [self presentViewController:settingNavVC
                       animated:YES
                     completion:^{
                         
                     }] ;
}



#pragma markk - life
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:NOTIFICATION_USER_LOGOUT
                                                  object:nil] ;
}

- (void)viewDidLoad
{
    // get titles
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"info_mineCell" ofType:@"plist"] ;
    self.dictionResource = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath] ;

    [super viewDidLoad] ;
    
    [self configureTable] ;
    [self configureNotificationCenter] ;
}

- (void)configureTable
{
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    _table.separatorColor = [UIColor xt_seperate] ;
    [_table registerNib:[UINib nibWithNibName:kID_MineUserInfoCell bundle:nil] forCellReuseIdentifier:kID_MineUserInfoCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_MineCell bundle:nil] forCellReuseIdentifier:kID_MineCell] ;
}

- (void)configureNotificationCenter

{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(noteForUserLogout)
                                                 name:NOTIFICATION_USER_LOGOUT
                                               object:nil] ;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO] ;
    [self.navigationController setNavigationBarHidden:NO] ;
    
    [_table reloadData] ;
}

#pragma mark - notification
- (void)noteForUserLogout
{
    [_table reloadSections:[NSIndexSet indexSetWithIndex:0]
          withRowAnimation:UITableViewRowAnimationNone] ;
    
    self.tabBarController.selectedIndex = 0 ;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1 ;
    }
    else if (section == 1) {
        return 1 ;
    }
    else if (section == 2) {
        return 1 ;
    }
    else if (section == 3) {
        return 3 ;
    }
    else if (section == 4) {
        return 4 ;
    }
    return 0 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    NSInteger row = indexPath.row ;
    if (section == 0) {
        MineUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MineUserInfoCell] ;
        cell.currentUser = [UserOnDevice currentUserOnDevice] ;
        cell.block_note = ^{
            NSLog(@"我的笔记") ;
            MyNoteCtrller *mynoteVC = (MyNoteCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MyNoteCtrller"] ;
            [mynoteVC setHidesBottomBarWhenPushed:YES] ;
            [self.navigationController pushViewController:mynoteVC animated:YES] ;
        } ;
        cell.block_focus = ^{
            NSLog(@"我的关注") ;
            MyFansFocusCtrller *mffVC = (MyFansFocusCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MyFansFocusCtrller"] ;
            mffVC.displayType = type_focus ;
            [mffVC setHidesBottomBarWhenPushed:YES] ;
            [self.navigationController pushViewController:mffVC animated:YES] ;
        } ;
        cell.block_fans = ^{
            NSLog(@"我的粉丝") ;
            MyFansFocusCtrller *mffVC = (MyFansFocusCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MyFansFocusCtrller"] ;
            mffVC.displayType = type_fans ;
            [mffVC setHidesBottomBarWhenPushed:YES] ;
            [self.navigationController pushViewController:mffVC animated:YES] ;
        } ;
        cell.block_page = ^{
            NSLog(@"我的主页") ;
            UserInfoCtrller *userCtrl = (UserInfoCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"UserInfoCtrller"] ;
            [userCtrl setHidesBottomBarWhenPushed:YES] ;
            [self.navigationController pushViewController:userCtrl animated:YES] ;
        } ;
        
        return cell ;
    }
    else if (section == 1) {
        return [self getMineCellWithKey:@"message"] ;
    }
    else if (section == 2) {
        return [self getMineCellWithKey:@"collection"] ;
    }
    else if (section == 3) {
        if (row == 0) {
            return [self getMineCellWithKey:@"shopCart"] ;
        }
        else if (row == 1) {
            return [self getMineCellWithKey:@"order"] ;
        }
        else if (row == 2) {
            return [self getMineCellWithKey:@"clear"] ;
        }
    }
    else if (section == 4) {
        if (row == 0) {
            return [self getMineCellWithKey:@"address"] ;
        }
        else if (row == 1) {
            return [self getMineCellWithKey:@"coupon"] ;
        }
        else if (row == 2) {
            return [self getMineCellWithKey:@"points"] ;
        }
        else if (row == 3) {
            return [self getMineCellWithKey:@"activity"] ;
        }
    }
    return nil ;
}


- (MineCell *)getMineCellWithKey:(NSString *)key
{
    MineCell *cell = [_table dequeueReusableCellWithIdentifier:kID_MineCell] ;
    [cell setupCellWithList:self.dictionResource[key]] ;
    return cell ;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    if (section == 0) {
        return 143. ;
    }
 
    return 54. ;
}

static NSString *const kIdentifierFooter = @"mycell_footer" ;

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kIdentifierFooter] ;
    if (!footer) {
        footer = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:kIdentifierFooter] ;
        UIView *bView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, 15.)] ;
        bView.backgroundColor = [UIColor clearColor] ;
        footer.backgroundView = bView ;
    }
    return footer ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15. ;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    NSInteger row = indexPath.row ;

    if (section == 1) {
        // 消息
        MessageCtrller *messageVC = (MessageCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MessageCtrller"] ;
        [messageVC setHidesBottomBarWhenPushed:YES] ;
        [self.navigationController pushViewController:messageVC animated:YES] ;
    }
    else if (section == 2) {
        // 收藏
        MyCollectionCtrller *myCollectionVC = (MyCollectionCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MyCollectionCtrller"] ;
        [myCollectionVC setHidesBottomBarWhenPushed:YES] ;
        [self.navigationController pushViewController:myCollectionVC animated:YES] ;
    }
    else if (section == 3) {
        if (row == 0) {
            // 购物车
            ShopCartCtrller *cartVC = (ShopCartCtrller *)[[self class] getCtrllerFromStory:@"Shop" controllerIdentifier:@"ShopCartCtrller"] ;
            [cartVC setHidesBottomBarWhenPushed:YES] ;
            [self.navigationController pushViewController:cartVC animated:YES] ;
        }
        else if (row == 1) {
            // 订单
            
        }
        else if (row == 2) {
            // 结算
        }
    }
    else if (section == 4) {
        if (row == 0) {
            // 地址
        }
        else if (row == 1) {
            // 邀请码
            MyCouponCodeCtrller *myCouponVC = (MyCouponCodeCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MyCouponCodeCtrller"] ;
            [myCouponVC setHidesBottomBarWhenPushed:YES] ;
            [self.navigationController pushViewController:myCouponVC animated:YES] ;
        }
        else if (row == 2) {
            // 积分
            MyPointsCtrller *pointsVC = (MyPointsCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MyPointsCtrller"] ;
            [pointsVC setHidesBottomBarWhenPushed:YES] ;
            [self.navigationController pushViewController:pointsVC animated:YES] ;
        }
        else if (row == 3) {
            // 活动
        }
    }
}


@end
