//
//  MyNoteCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/28.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyNoteCtrller.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HPProductCollectionCell.h"
#import "RootCollectionView.h"
#import "NoteListViewItem.h"
#import "UserOnDevice.h"
#import "NoteDetailCtrller.h"

@interface MyNoteCtrller () <UICollectionViewDataSource,UICollectionViewDelegate,CHTCollectionViewDelegateWaterfallLayout,RootCollectionViewDelegate,HomePageCollectionCellDelegate>

@property (weak, nonatomic) IBOutlet UIView *topbarbg;
@property (weak, nonatomic) IBOutlet UIView *topbarbg2;
@property (weak, nonatomic) IBOutlet UITextField *tf_search;
@property (weak, nonatomic) IBOutlet RootCollectionView *collectionView;

@property (nonatomic,strong) CHTCollectionViewWaterfallLayout *waterflowLayout ;
@property (nonatomic,strong) NSArray *listNotes ;

@end

@implementation MyNoteCtrller

#pragma mark - prop

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


#pragma mark - life

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    // Do any additional setup after loading the view.
    _topbarbg.backgroundColor = [UIColor xt_seperate] ;
    _topbarbg2.layer.cornerRadius = 5. ;
    
    _collectionView.backgroundColor = [UIColor xt_collectionBackgroundColor] ;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.xt_delegate = self ;
    _collectionView.collectionViewLayout = self.waterflowLayout ;
    [_collectionView registerNib:[UINib nibWithNibName:id_HPProductCollectionCell bundle:[NSBundle mainBundle]]
      forCellWithReuseIdentifier:id_HPProductCollectionCell] ;
    
}

static const int kHowmany = 20 ;

#pragma mark - RootCollectionViewDelegate

- (void)loadNewData
{
    [ServerRequest searchNoteListByUser:self.userID
                                refresh:1
                            currentUser:[UserOnDevice currentUserOnDevice].userId
                                   from:0
                                howmany:kHowmany
                                success:^(id json) {
                                    ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                    if (result.code == 1) {
                                        NSMutableArray *tmplist = [@[] mutableCopy] ;
                                        NSArray *listDic = result.data[@"noteList"] ;
                                        for (id dic in listDic) {
                                            NoteListViewItem *item = [NoteListViewItem yy_modelWithJSON:dic] ;
                                            [tmplist addObject:item] ;
                                        }
                                        self.listNotes = tmplist ;
                                        [_collectionView reloadData] ;
                                    }
                                }
                                   fail:^{
                                       
                                   }] ;
}

- (void)loadMoreData
{
    [ServerRequest searchNoteListByUser:self.userID
                                refresh:0
                            currentUser:[UserOnDevice currentUserOnDevice].userId
                                   from:(int)self.listNotes.count
                                howmany:kHowmany
                                success:^(id json) {
                                    ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                    if (result.code == 1) {
                                        NSMutableArray *tmplist = [self.listNotes mutableCopy] ;
                                        NSArray *listDic = result.data[@"noteList"] ;
                                        for (id dic in listDic) {
                                            NoteListViewItem *item = [NoteListViewItem yy_modelWithJSON:dic] ;
                                            [tmplist addObject:item] ;
                                        }
                                        self.listNotes = tmplist ;
                                        [_collectionView reloadData] ;
                                    }
                                }
                                   fail:^{
                                       
                                   }] ;
}

#pragma mark - collection dataSourse
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1 ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listNotes.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HPProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id_HPProductCollectionCell forIndexPath:indexPath] ;
    cell.noteItem = self.listNotes[indexPath.row] ;
    cell.delegate = self ;
    return cell ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [HPProductCollectionCell getSize] ;
}


#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NoteDetailCtrller *detailCtrller = (NoteDetailCtrller *)[[self class] getCtrllerFromStory:@"HomePage" controllerIdentifier:@"NoteDetailCtrller"] ;
    NSString *articleIDWillSend = nil ;
    NoteListViewItem *note = self.listNotes[indexPath.row] ;
    articleIDWillSend = note.articleId ;
    
    detailCtrller.articleId = articleIDWillSend ;
    detailCtrller.blockFocus = ^(NSString *userID, BOOL bFocus){
        [self.listNotes enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
            if ([noteItem.ownerId isEqualToString:userID]) {
                noteItem.isFollow = bFocus ; // 关注
            }
        }] ;
        
        [_collectionView reloadData] ;
        
    } ;
    detailCtrller.blockUpvote = ^(NSString *noteID, BOOL bUpvote){
        [self.listNotes enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
            if ([noteItem.articleId isEqualToString:noteID]) {
                noteItem.isUpvote = bUpvote ; // 点赞
                noteItem.upvoteCnt = bUpvote ? ++noteItem.upvoteCnt : --noteItem.upvoteCnt ; // 点赞数
                *stop = YES ;
            }
        }] ;
        [_collectionView reloadData] ;
    } ;
    
    detailCtrller.blockFavorite = ^(NSString *noteID, BOOL bFavorite){
        [self.listNotes enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
            if ([noteItem.articleId isEqualToString:noteID]) {
                noteItem.isFavorite = bFavorite ; // 收藏
                *stop = YES ;
            }
        }] ;
        [_collectionView reloadData] ;
    } ;
    
    [self.navigationController pushViewController:detailCtrller animated:YES] ;
}


#pragma mark - HomePageCollectionCellDelegate <NSObject>
- (BOOL)likeNoteID:(NSString *)noteID addOrRemove:(bool)addOrRemove
{
    BOOL hasLogin = [UserOnDevice checkForLoginOrNot:self] ;
    if (!hasLogin) return false;
    
    if (addOrRemove)
    {
        [ServerRequest addLikeWithID:noteID
                               token:[UserOnDevice token]
                             success:^(id json) {
                                 [self.listNotes enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
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
                                    [self.listNotes enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
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
                                     [self.listNotes enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
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
                                        [self.listNotes enumerateObjectsUsingBlock:^(NoteListViewItem *noteItem,
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
