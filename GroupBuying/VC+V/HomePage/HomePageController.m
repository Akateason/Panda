//
//  HomePageController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HomePageController.h"
#import "RootCollectionView.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HPProductCollectionCell.h"
#import "HPBigPhotoCollectionCell.h"
#import "HomePageController+collectionLayoutSwitch.h"
#import "HPBigPhotoHeaderView.h"
#import "XLPlainFlowLayout.h"
#import "KxMenu.h"
#import "UIColor+HexString.h"
#import "HomePageController+TitleManager.h"
#import "RankingViewController.h"
#import "CameraNavCtrller.h"
#import "UserInfoCtrller.h"
#import "NoteDetailCtrller.h"
#import "UserOnDevice.h"
#import "NoteListViewItem.h"
#import "NotificationCenterHeader.h"

static NSInteger const kPageHowmany = 20 ;

typedef NS_ENUM(NSUInteger, HOMEPAGE_SEARCHTYPE) {
    type_all = 0 ,
    type_myFoucus,
    type_canBuy
};


@interface HomePageController () <UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout,RootCollectionViewDelegate,HPBigPhotoHeaderViewDelegate,HomePageCollectionCellDelegate>

// nav
@property (weak, nonatomic) IBOutlet UIButton *itemRanking;
@property (weak, nonatomic) IBOutlet UIButton *itemCamera;
@property (weak, nonatomic) IBOutlet UIButton *itemSwitcher;
// collection view
@property (strong, nonatomic) RootCollectionView *collectionView;
@property (nonatomic,strong) CHTCollectionViewWaterfallLayout *waterflowLayout ;
@property (nonatomic,strong) XLPlainFlowLayout *bplayout ;


@property (nonatomic,strong) NSArray                *listNote ;
@property (nonatomic)        HOMEPAGE_SEARCHTYPE    schType ;

@property (nonatomic,strong) UIImageView            *nothingImageView ;

@end

@implementation HomePageController


#pragma mark - HPBigPhotoHeaderViewDelegate
- (void)userheadOnClickWithUserID:(NSString *)userID userName:(NSString *)name
{
    UserInfoCtrller *userCtrl = (UserInfoCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"UserInfoCtrller"] ;
    userCtrl.userID = userID ;
    userCtrl.userNameDisplay = name ;
    [userCtrl setHidesBottomBarWhenPushed:YES] ;
    [self.navigationController pushViewController:userCtrl animated:YES] ;
}

- (BOOL)followUserBtOnClickWithCreaterID:(NSString *)createrID followed:(BOOL)bFollow
{
    BOOL hasLogin = [UserOnDevice checkForLoginOrNot:self] ;
    if (!hasLogin) return false ;
    
    if (bFollow) {
        [ServerRequest addFollowWithUserID:createrID
                                   success:^(id json) {
                                       ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                       if (result.code == 1) {
                                           [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem, NSUInteger idx, BOOL * _Nonnull stop) {
                                               if ([noteItem.ownerId isEqualToString:createrID]) {
                                                   noteItem.isFollow = true ;
                                               }
                                           }] ;
                                           [_collectionView reloadData] ;
                                       }
                                   } fail:^{
                                       
                                   }] ;
    }
    else {
        [ServerRequest cancelFollowWithUserID:createrID
                                      success:^(id json) {
                                          
                                          ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                          if (result.code == 1) {
                                              [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem, NSUInteger idx, BOOL * _Nonnull stop) {
                                                  if ([noteItem.ownerId isEqualToString:createrID]) {
                                                      noteItem.isFollow = false ;
                                                  }
                                              }] ;
                                              [_collectionView reloadData] ;
                                          }
                                          
                                      } fail:^{
                                          
                                      }] ;
    }
    
    return true ;
}

#pragma mark -  HomePageCollectionCellDelegate <NSObject>
- (BOOL)likeNoteID:(NSString *)noteID addOrRemove:(bool)addOrRemove
{    
    BOOL hasLogin = [UserOnDevice checkForLoginOrNot:self] ;
    if (!hasLogin) return false;
    
    if (addOrRemove)
    {
        [ServerRequest addLikeWithID:noteID
                               token:[UserOnDevice token]
                             success:^(id json) {
                                 [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                                             NSUInteger idx,
                                                                             BOOL * _Nonnull stop) {
                                     if ([noteItem.articleId isEqualToString:noteID])
                                     {
                                         noteItem.isUpvote = true ;
                                         *stop = true ;
                                     }
                                 }] ;
                                 
                             } fail:^{
                                 
                             }] ;
    }
    else
    {
        [ServerRequest removeLikeWithID:noteID
                                  token:[UserOnDevice token]
                                success:^(id json) {
                                    [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                                                NSUInteger idx,
                                                                                BOOL * _Nonnull stop) {
                                        if ([noteItem.articleId isEqualToString:noteID])
                                        {
                                            noteItem.isUpvote = false ;
                                            *stop = true ;
                                        }
                                    }] ;
                                } fail:^{
                                    
                                }] ;
    }
    return true ;
}

- (BOOL)collectNoteID:(NSString *)noteID addOrRemove:(bool)addOrRemove
{
    BOOL hasLogin = [UserOnDevice checkForLoginOrNot:self] ;
    if (!hasLogin) return false;
    
    if (addOrRemove) {
        [ServerRequest addFavoriteWithID:noteID
                                 success:^(id json) {
                                     [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                                                 NSUInteger idx,
                                                                                 BOOL * _Nonnull stop) {
                                         if ([noteItem.articleId isEqualToString:noteID])
                                         {
                                             noteItem.isFavorite = true ;
                                             *stop = true ;
                                         }
                                     }] ;
                                 } fail:^{
                                     
                                 }] ;
    }
    else {
        [ServerRequest removeFavoriteWithID:noteID
                                    success:^(id json) {
                                        [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                                                    NSUInteger idx,
                                                                                    BOOL * _Nonnull stop) {
                                            if ([noteItem.articleId isEqualToString:noteID])
                                            {
                                                noteItem.isFavorite = false ;
                                                *stop = true ;
                                            }
                                        }] ;
                                    } fail:^{
                                        
                                    }] ;
    }
    return true ;
}


#pragma mark - action

- (IBAction)btTitleLogoOnCLick:(UIButton *)sender
{
    // show pop menu .
    CGRect rect = sender.frame ;
    rect.origin.y += sender.frame.size.height / 2. ;
    [KxMenu showMenuInView:self.view.window fromRect:rect menuItems:self.menuItems] ;
    
    // 模拟 [ 有新数据 ]
//    [self itemIndex:0 hasNewData:YES] ;
//    [self itemIndex:1 hasNewData:YES] ;
//    [self itemIndex:2 hasNewData:NO] ;
}

- (void)toAll:(KxMenuItem *)item
{
    NSLog(@"全部") ;
    [self.btTitleLogo setTitle:[self getDisplayStringWithPopItemIndex:0]
                      forState:0] ;
    self.schType = type_all ;
}

- (void)toMyFocus:(KxMenuItem *)item
{
    NSLog(@"我关注的人") ;
    [self.btTitleLogo setTitle:[self getDisplayStringWithPopItemIndex:1]
                      forState:0] ;
    self.schType = type_myFoucus ;
}

- (void)toCanBuy:(KxMenuItem *)item
{
    NSLog(@"可购买的") ;
    [self.btTitleLogo setTitle:[self getDisplayStringWithPopItemIndex:2]
                      forState:0] ;
    self.schType = type_canBuy ;
}

- (IBAction)itemRankingOnClick:(id)sender {
    NSLog(@"排行榜") ;
    RankingViewController *rankCtrller = (RankingViewController *)[RankingViewController getCtrllerFromStory:@"HomePage" controllerIdentifier:@"RankingViewController"] ;
    [rankCtrller setHidesBottomBarWhenPushed:YES] ;
    [self.navigationController pushViewController:rankCtrller animated:YES] ;
}

- (IBAction)itemCameraOnclick:(id)sender
{
    // login
    [UserOnDevice checkForLoginOrNot:self] ;

    NSLog(@"照相机") ;
    CameraNavCtrller *cNavCtrller = [CameraNavCtrller getNavCtrller] ;
    [cNavCtrller setHidesBottomBarWhenPushed:YES] ;
    [self presentViewController:cNavCtrller animated:YES completion:^{
        
    }] ;
}

- (IBAction)itemSwitcherOnClick:(id)sender {
    NSLog(@"切换视图") ;
    self.itemSwitcher.enabled = false ;
    self.itemSwitcher.selected = !self.itemSwitcher.selected ;
    if (self.itemSwitcher.selected) {
        [self setLayout:self.bplayout collectionView:_collectionView switcher:self.itemSwitcher] ;
    }
    else {
        [self setLayout:self.waterflowLayout collectionView:_collectionView switcher:self.itemSwitcher] ;
    }
    
}

#pragma mark - prop

- (void)setSchType:(HOMEPAGE_SEARCHTYPE)schType
{
    _schType = schType ;
    
    switch (schType) {
        case type_all:
        {
            if (self.nothingImageView.superview) {
                [self.nothingImageView removeFromSuperview] ;
                self.collectionView.hidden = false ;
            }
        }
            break;
        case type_myFoucus:
        {
            if (!self.nothingImageView.superview) {
                [self.view addSubview:self.nothingImageView] ;
                self.collectionView.hidden = true ;
            }
        }
            break;
        case type_canBuy:
        {
            if (!self.nothingImageView.superview) {
                [self.view addSubview:self.nothingImageView] ;
                self.collectionView.hidden = true ;
            }
        }
            break;
        default:
            break;
    }
}

- (UIImageView *)nothingImageView
{
    if (!_nothingImageView) {
        CGRect rect = APPFRAME ;
        rect.origin.y = 64 ;
        rect.size.height -= 64 - APP_TABBAR_HEIGHT ;
        _nothingImageView = [[UIImageView alloc] initWithFrame:rect] ;
        _nothingImageView.image = [UIImage imageNamed:@"test_nothing"] ;
        _nothingImageView.contentMode = UIViewContentModeScaleAspectFill ;
    }
    return _nothingImageView ;
}

- (NSArray *)menuItems
{
    if (!_menuItems) {
        _menuItems = @[
                       [KxMenuItem menuItem:@"全部"
                                      image:nil
                                     target:self
                                     action:@selector(toAll:)] ,
                       [KxMenuItem menuItem:@"我关注的人"
                                      image:nil
                                     target:self
                                     action:@selector(toMyFocus:)] ,
                       [KxMenuItem menuItem:@"可购买的"
                                      image:nil
                                     target:self
                                     action:@selector(toCanBuy:)]
                       ] ;
    }
    return _menuItems ;
}

- (RootCollectionView *)collectionView {
    if (!_collectionView)
    {
        _collectionView = [[RootCollectionView alloc] initWithFrame:[self getCollectionRect]
                                               collectionViewLayout:self.waterflowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.xt_delegate = self ;
        _collectionView.backgroundColor = [UIColor xt_collectionBackgroundColor] ;
        _collectionView.showsVerticalScrollIndicator = NO ;
        [_collectionView registerNib:[UINib nibWithNibName:id_HPProductCollectionCell bundle:[NSBundle mainBundle]]
              forCellWithReuseIdentifier:id_HPProductCollectionCell] ;
        [_collectionView registerNib:[UINib nibWithNibName:id_HPBigPhotoCollectionCell bundle:[NSBundle mainBundle]]
          forCellWithReuseIdentifier:id_HPBigPhotoCollectionCell] ;
        [_collectionView registerNib:[UINib nibWithNibName:id_HPBigPhotoHeaderView bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:id_HPBigPhotoHeaderView] ;
    }
    return _collectionView;
}

- (CHTCollectionViewWaterfallLayout *)waterflowLayout
{
    if (!_waterflowLayout) {
        _waterflowLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
        _waterflowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
        _waterflowLayout.headerHeight = 0;
        _waterflowLayout.footerHeight = 0;
        _waterflowLayout.minimumColumnSpacing = 3;
        _waterflowLayout.minimumInteritemSpacing = 3;
    }
    return _waterflowLayout ;
}

- (XLPlainFlowLayout *)bplayout
{
    if (!_bplayout) {
        _bplayout = [[XLPlainFlowLayout alloc] init] ;
        _bplayout.itemSize = CGSizeMake(APP_WIDTH, [HPBigPhotoCollectionCell getSizeWithTitleStr:@"aa"].height) ;
        _bplayout.sectionInset = UIEdgeInsetsMake(0, 0, 10, 0) ;
    }
    return _bplayout ;
}

#pragma mark - life
- (void)dealloc
{
    _collectionView.delegate = nil ;
    _collectionView.dataSource = nil ;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_POST_ARTICLE_COMPLETE object:nil] ;
    [[NSNotificationCenter defaultCenter] removeObserver:self  name:NOTIFICATION_USER_LOGOUT object:nil] ;
    [[NSNotificationCenter defaultCenter] removeObserver:self  name:NOTIFICATION_USER_LOGIN object:nil] ;
}

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    [self configureUIs] ;
    [self configureNotifications] ;
}

- (void)configureUIs
{
    // nav item position
    [self.view addSubview:self.collectionView] ;
    // title pop menu .
    [KxMenu setTintColor:[UIColor colorWithHexString:@"555555" alpha:0.5]] ;
}

- (void)configureNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(articlePostComplete)
                                                 name:NOTIFICATION_POST_ARTICLE_COMPLETE
                                               object:nil] ;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(noteForUserLogout)
                                                 name:NOTIFICATION_USER_LOGOUT
                                               object:nil] ;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(noteForUserLogin)
                                                 name:NOTIFICATION_USER_LOGIN
                                               object:nil] ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    [self.navigationController setNavigationBarHidden:YES] ;
    [[UIApplication sharedApplication] setStatusBarHidden:NO] ;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated] ;
    [self.navigationController setNavigationBarHidden:NO] ;
}





#pragma mark - NOTIFICATION_POST_ARTICLE_COMPLETE
- (void)articlePostComplete
{
    [_collectionView pullDownRefreshHeader] ;
}

- (void)noteForUserLogout
{
    [_collectionView pullDownRefreshHeader] ;
}

- (void)noteForUserLogin
{
    [_collectionView pullDownRefreshHeader] ;
}


#pragma mark - RootCollectionViewDelegate

- (void)loadNewData
{
    NSString *userID = [UserOnDevice currentUserOnDevice].userId ;
    NSLog(@"userID : %@",userID) ;
    
    [ServerRequest homelistWithSearchtype:@(self.schType)
                                  refresh:@(1)
                                   userID:userID
                                     from:@(0)
                                  howmany:@(kPageHowmany)
                                  success:^(id json) {
                                      
                                      ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                      NSArray *noteDicList = result.data[@"noteList"] ;
                                      if (!noteDicList.count) return ;
                                      NSMutableArray *tmpList = [@[] mutableCopy] ;
                                      for (NSDictionary *jsonObj in noteDicList)
                                      {
                                          NoteListViewItem *item = [NoteListViewItem yy_modelWithJSON:jsonObj] ;
                                          [tmpList addObject:item] ;
                                      }
                                      self.listNote = tmpList ;
                                      
                                      [_collectionView reloadData] ;
                                      
                                  } fail:^{
                                      
                                  }] ;
    
}

- (void)loadMoreData
{
    NSString *userID = [UserOnDevice currentUserOnDevice].userId ;
    NSLog(@"userID : %@",userID) ;

    [ServerRequest homelistWithSearchtype:@(self.schType)
                                  refresh:@(0)
                                   userID:userID
                                     from:@(self.listNote.count)
                                  howmany:@(kPageHowmany)
                                  success:^(id json) {
                                      
                                      ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                      NSArray *noteDicList = result.data[@"noteList"] ;
                                      if (!noteDicList.count) return ;
                                      NSMutableArray *tmpList = [self.listNote mutableCopy] ;
                                      for (NSDictionary *jsonObj in noteDicList)
                                      {
                                          NoteListViewItem *item = [NoteListViewItem yy_modelWithJSON:jsonObj] ;
                                          [tmpList addObject:item] ;
                                      }
                                      self.listNote = tmpList ;
                                      
                                      [_collectionView reloadData] ;
                                      
                                  } fail:^{
                                      
                                  }] ;
    
}

#pragma mark - collection dataSourse
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (collectionView.collectionViewLayout == self.bplayout) {
       return self.listNote.count ;
    }
    else if (collectionView.collectionViewLayout == self.waterflowLayout) {
       return 1 ;
    }
    return 1 ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.collectionViewLayout == self.bplayout) {
        return 1 ;
    }
    else if (collectionView.collectionViewLayout == self.waterflowLayout) {
        return self.listNote.count ;
    }
    return 0 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Set up the reuse identifier
    if (collectionView.collectionViewLayout == self.bplayout) {
        HPBigPhotoCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id_HPBigPhotoCollectionCell forIndexPath:indexPath] ;
        cell.noteItem = self.listNote[indexPath.section] ;
        cell.delegate = self ;
        return cell ;

    }
    else if (collectionView.collectionViewLayout == self.waterflowLayout) {
        HPProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id_HPProductCollectionCell forIndexPath:indexPath];
        cell.noteItem = self.listNote[indexPath.row] ;
        cell.delegate = self ;
        return cell;
    }
    return nil ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionViewLayout == self.bplayout) {
        NoteListViewItem *note = self.listNote[indexPath.section] ;
        return [HPBigPhotoCollectionCell getSizeWithTitleStr:note.articleTitle] ;
    }
    if (collectionViewLayout == self.waterflowLayout) {
        return [HPProductCollectionCell getSize] ;
    }
    return CGSizeZero ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (collectionViewLayout == self.bplayout) {
        return CGSizeMake(APP_WIDTH, 70.) ;
    }
    return CGSizeZero ;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil ;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HPBigPhotoHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:id_HPBigPhotoHeaderView forIndexPath:indexPath];
        headerView.noteItem = self.listNote[indexPath.section] ;
        headerView.delegate = self ;
        return headerView ;
    }
    return reusableView ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NoteDetailCtrller *detailCtrller = (NoteDetailCtrller *)[[self class] getCtrllerFromStory:@"HomePage" controllerIdentifier:@"NoteDetailCtrller"] ;
    NSString *articleIDWillSend = nil ;
    if (collectionView.collectionViewLayout == self.bplayout)
    {
        NoteListViewItem *note = self.listNote[indexPath.section] ;
        articleIDWillSend = note.articleId ;
    }
    else if (collectionView.collectionViewLayout == self.waterflowLayout)
    {
        NoteListViewItem *note = self.listNote[indexPath.row] ;
        articleIDWillSend = note.articleId ;
    }
    detailCtrller.articleId = articleIDWillSend ;
    detailCtrller.blockFocus = ^(NSString *userID, BOOL bFocus){
        [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
            if ([noteItem.ownerId isEqualToString:userID]) {
                noteItem.isFollow = bFocus ;
            }
        }] ;
        
        [_collectionView reloadData] ;

    } ;
    detailCtrller.blockUpvote = ^(NSString *noteID, BOOL bUpvote){
        [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
            if ([noteItem.articleId isEqualToString:noteID]) {
                noteItem.isUpvote = bUpvote ;
                *stop = YES ;
            }
        }] ;
        [_collectionView reloadData] ;
    } ;
    
    detailCtrller.blockFavorite = ^(NSString *noteID, BOOL bFavorite){
        [self.listNote enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
            if ([noteItem.articleId isEqualToString:noteID]) {
                noteItem.isFavorite = bFavorite ;
                *stop = YES ;
            }
        }] ;
        [_collectionView reloadData] ;
    } ;
    
    [detailCtrller setHidesBottomBarWhenPushed:YES] ;
    [self.navigationController pushViewController:detailCtrller animated:YES] ;    
}

#pragma mark - util
- (CGRect)getCollectionRect
{
    CGRect rect = self.view.bounds ;
    rect.size.height -= (APP_TABBAR_HEIGHT + APP_NAVIGATIONBAR_HEIGHT + APP_STATUSBAR_HEIGHT) ;
    rect.origin.y = APP_NAVIGATIONBAR_HEIGHT + APP_STATUSBAR_HEIGHT ;
    return rect ;
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    [segue.destinationViewController setHidesBottomBarWhenPushed:YES] ;
}

@end
