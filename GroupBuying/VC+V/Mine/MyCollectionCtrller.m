//
//  MyCollectionCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/10/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyCollectionCtrller.h"
#import "RootCollectionView.h"
#import "XTSegment.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HPProductCollectionCell.h"
#import "TDCProductCollectionCell.h"
#import "UserOnDevice.h"
#import "NoteListViewItem.h"
#import "NoteDetailCtrller.h"

static const int kHowmany = 20 ;

typedef NS_ENUM(int, MCVC_CollectionCellDisplayType) {
    status_note,
    status_product
};


@interface MyCollectionCtrller () <UICollectionViewDataSource,UICollectionViewDelegate,RootCollectionViewDelegate,XTSegmentDelegate,CHTCollectionViewDelegateWaterfallLayout,HomePageCollectionCellDelegate>
@property (weak, nonatomic) IBOutlet RootCollectionView *collectionView;
@property (nonatomic,strong) XTSegment *segment ;
@property (nonatomic,strong) CHTCollectionViewWaterfallLayout *waterflowLayout ;
@property (nonatomic)        MCVC_CollectionCellDisplayType type_CellDisplay ;
@end

@interface MyCollectionCtrller ()
@property (nonatomic,strong) NSArray *listNotes ;
@end

@implementation MyCollectionCtrller


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

- (XTSegment *)segment
{
    if (!_segment) {
        _segment = [[XTSegment alloc] initWithDataList:@[@"笔记收藏",@"产品收藏"]
                                                 imgBg:[UIImage imageNamed:@"btBase"]
                                                height:45.
                                           normalColor:[UIColor xt_w_light]
                                           selectColor:[UIColor xt_tabbarRedColor]
                                                  font:[UIFont systemFontOfSize:14.]
                                                 frame:APPFRAME] ;
        _segment.backgroundColor = [UIColor whiteColor] ;
        _segment.delegate = self ;
        _segment.frame = CGRectMake(0, 0, APP_WIDTH, 45.) ;
        if (!_segment.superview) {
            [self.view addSubview:_segment] ;
        }
    }
    return _segment ;
}

#pragma mark - XTSegmentDelegate
- (void)clickSegmentWith:(int)index
{
    NSLog(@"index : %d",index) ; // 切换 segment
    self.type_CellDisplay = index ;
    [_collectionView pullDownRefreshHeader] ;
}


#pragma mark - life

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"我的收藏" ;
    [self segment] ;
    [self configureCollections] ;
}

- (void)configureCollections
{
    _collectionView.backgroundColor = [UIColor xt_seperate] ;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.xt_delegate = self ;
    _collectionView.collectionViewLayout = self.waterflowLayout ;
    [_collectionView registerNib:[UINib nibWithNibName:id_HPProductCollectionCell bundle:[NSBundle mainBundle]]
      forCellWithReuseIdentifier:id_HPProductCollectionCell] ;
    [_collectionView registerNib:[UINib nibWithNibName:kID_TDCProductCollectionCell bundle:nil] forCellWithReuseIdentifier:kID_TDCProductCollectionCell] ;
}


#pragma mark - RootCollectionViewDelegate

- (void)loadNewData
{
    if (self.type_CellDisplay == status_note)
    {
        [ServerRequest userCollectionlistByToken:[UserOnDevice token]
                                            from:0
                                         howmany:kHowmany
                                         success:^(id json) {
                                             ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                             if (result.code == 1) {
                                                 NSMutableArray *tmplist = [@[] mutableCopy] ;
                                                 NSArray *dicList = result.data[@"noteList"] ;
                                                 for (id dic in dicList) {
                                                     NoteListViewItem *noteItem = [NoteListViewItem yy_modelWithJSON:dic] ;
                                                     [tmplist addObject:noteItem] ;
                                                 }
                                                 self.listNotes = tmplist ;
                                                 [_collectionView reloadData] ;
                                             }
                                         }
                                            fail:^{
                                                
                                            }] ;
    }
    else if (self.type_CellDisplay == status_product)
    {
        
    }
}

- (void)loadMoreData
{
    if (self.type_CellDisplay == status_note)
    {
        [ServerRequest userCollectionlistByToken:[UserOnDevice token]
                                            from:(int)self.listNotes.count
                                         howmany:kHowmany
                                         success:^(id json) {
                                             ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                             if (result.code == 1) {
                                                 NSMutableArray *tmplist = [self.listNotes mutableCopy] ;
                                                 NSArray *dicList = result.data[@"noteList"] ;
                                                 for (id dic in dicList) {
                                                     NoteListViewItem *noteItem = [NoteListViewItem yy_modelWithJSON:dic] ;
                                                     [tmplist addObject:noteItem] ;
                                                 }
                                                 self.listNotes = tmplist ;
                                                 [_collectionView reloadData] ;
                                             }
                                         }
                                            fail:^{
                                                
                                            }] ;
    }
    else if (self.type_CellDisplay == status_product)
    {
        
    }
}

#pragma mark - collection dataSourse
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1 ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.type_CellDisplay == status_note) {
        return self.listNotes.count ;
    }
    else if (self.type_CellDisplay == status_product) {
        return 10 ;
    }
    return 0 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.type_CellDisplay == status_note) {
        HPProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id_HPProductCollectionCell forIndexPath:indexPath];
        cell.noteItem = self.listNotes[indexPath.row] ;
        cell.delegate = self ;
        return cell;
    }
    else if (self.type_CellDisplay == status_product) {
        TDCProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID_TDCProductCollectionCell forIndexPath:indexPath] ;
        return cell ;
    }
    return nil ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [HPProductCollectionCell getSize] ;
}


#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.type_CellDisplay == status_note)
    {
        // note
        NoteDetailCtrller *detailCtrller = (NoteDetailCtrller *)[[self class] getCtrllerFromStory:@"HomePage" controllerIdentifier:@"NoteDetailCtrller"] ;
        NoteListViewItem *note = self.listNotes[indexPath.row] ;
        NSString *articleIDWillSend = note.articleId ;
        
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
    else if (self.type_CellDisplay == status_product)
    {
        // product
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
