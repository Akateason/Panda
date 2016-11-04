//
//  TagDetailCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "TagDetailCtrller.h"
#import "XTSegment.h"
#import "RootCollectionView.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HPProductCollectionCell.h"
#import "NoteDetailCtrller.h"
#import "TDCProductCollectionCell.h"
#import "SearchConditionView.h"
#import "UserOnDevice.h"
#import "NoteListViewItem.h"

static const int kHowmany = 20 ;

typedef NS_ENUM(int, TDVC_CollectionCellDisplayType) {
    status_note ,        // 笔记
    status_product       // 商品
};

// UIs
@interface TagDetailCtrller () <XTSegmentDelegate,UICollectionViewDelegate,UICollectionViewDataSource,RootCollectionViewDelegate,CHTCollectionViewDelegateWaterfallLayout>
@property (weak, nonatomic) IBOutlet RootCollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *toolView;
@property (weak, nonatomic) IBOutlet UIView *seg_containerView;
@property (weak, nonatomic) IBOutlet UIButton *btSortWay;
@property (nonatomic,strong) XTSegment *segment ;
@property (nonatomic,strong) CHTCollectionViewWaterfallLayout   *waterflowLayout ;
@property (nonatomic)        TDVC_CollectionCellDisplayType     type_CellDisplay ;
@property (nonatomic,strong) SearchConditionView                *schConditionView ;
@end

// Datas
@interface TagDetailCtrller ()
@property (nonatomic,strong) NSArray *listNote ;
@end

@implementation TagDetailCtrller

#pragma mark - XTSegmentDelegate

- (void)clickSegmentWith:(int)index
{
    self.type_CellDisplay = index ;
    
    [_collectionView reloadData] ;
}


#pragma mark - action

- (IBAction)btSortWayOnClick:(UIButton *)buttonSortWay
{
    NSLog(@"sort condition bt") ;
    if (!self.schConditionView.superview) {
        [self.schConditionView showInView:self.view] ;
    }
    else {
        [self.schConditionView dismiss] ;
    }
}


#pragma mark - prop
- (SearchConditionView *)schConditionView
{
    if (!_schConditionView) {
        _schConditionView = [[SearchConditionView alloc] initWithFrame:CGRectMake(0, CGHeight(self.seg_containerView.frame), APP_WIDTH, APP_HEIGHT - CGHeight(self.seg_containerView.frame) - APP_NAVIGATIONBAR_HEIGHT - APP_STATUSBAR_HEIGHT)] ;
        [_schConditionView.schTable setListConditions:@[@"综合排序",@"按时间",@"按热度"]] ;
    }
    return _schConditionView ;
}


- (void)setTagStr:(NSString *)tagStr
{
    _tagStr = tagStr ;
    
    self.title = [@"#" stringByAppendingString:tagStr] ;
}

- (XTSegment *)segment
{
    if (!_segment) {
        _segment = [[XTSegment alloc] initWithDataList:@[@"笔记",@"商品"]
                                                 imgBg:[UIImage imageNamed:@"btBase"]
                                                height:45.
                                           normalColor:[UIColor xt_w_light]
                                           selectColor:[UIColor xt_tabbarRedColor]
                                                  font:[UIFont systemFontOfSize:14.]
                                                 frame:CGRectMake(0, 0, _seg_containerView.frame.size.width, 45.)] ;
        _segment.backgroundColor = [UIColor whiteColor] ;
        _segment.delegate = self ;
        if (!_segment.superview) {
            [_seg_containerView addSubview:_segment] ;
        }
    }
    return _segment ;
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

#pragma mark - life

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self segment] ;
    
    _toolView.backgroundColor = [UIColor whiteColor] ;
    _seg_containerView.backgroundColor = [UIColor whiteColor] ;
    [_btSortWay setTitleColor:[UIColor xt_w_dark] forState:0] ;
    
    _collectionView.collectionViewLayout = self.waterflowLayout ;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.xt_delegate = self ;
    _collectionView.backgroundColor = [UIColor xt_collectionBackgroundColor] ;
    _collectionView.showsVerticalScrollIndicator = NO ;
    [_collectionView registerNib:[UINib nibWithNibName:id_HPProductCollectionCell bundle:[NSBundle mainBundle]]
      forCellWithReuseIdentifier:id_HPProductCollectionCell] ;
    [_collectionView registerNib:[UINib nibWithNibName:kID_TDCProductCollectionCell bundle:nil] forCellWithReuseIdentifier:kID_TDCProductCollectionCell] ;

}

#pragma mark - reload 

- (void)loadNewData
{
    [ServerRequest searchNotesByTagWithSortType:[self.schConditionView.schTable resultSelectedIndex]
                                            tag:self.tagStr
                                        refresh:1
                                         userId:[UserOnDevice currentUserOnDevice].userId
                                           from:0
                                        howmany:kHowmany
                                        success:^(id json) {
                                            
                                            ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                            if (result.code == 1)
                                            {
                                                NSMutableArray *tmplist = [@[] mutableCopy] ;
                                                NSArray *dicList = result.data[@"noteList"] ;
                                                for (NSDictionary *dic in dicList) {
                                                    NoteListViewItem *item = [NoteListViewItem yy_modelWithJSON:dic] ;
                                                    [tmplist addObject:item] ;
                                                }
                                                self.listNote = tmplist ;
                                                
                                                [_collectionView reloadData] ;
                                            }
                                            
                                        } fail:^{
                                            
                                        }] ;
    
    
}

- (void)loadMoreData
{
    [ServerRequest searchNotesByTagWithSortType:[self.schConditionView.schTable resultSelectedIndex]
                                            tag:self.tagStr
                                        refresh:0
                                         userId:[UserOnDevice currentUserOnDevice].userId
                                           from:(int)self.listNote.count
                                        howmany:kHowmany
                                        success:^(id json) {
                                            
                                            ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                                            if (result.code == 1)
                                            {
                                                NSMutableArray *tmplist = [self.listNote mutableCopy] ;
                                                NSArray *dicList = result.data[@"noteList"] ;
                                                for (NSDictionary *dic in dicList) {
                                                    NoteListViewItem *item = [NoteListViewItem yy_modelWithJSON:dic] ;
                                                    [tmplist addObject:item] ;
                                                }
                                                self.listNote = tmplist ;
                                                
                                                [_collectionView reloadData] ;
                                            }
                                            
                                        } fail:^{
                                            
                                        }] ;
}

#pragma mark - collection dataSourse
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.type_CellDisplay == status_note)
    {
        return self.listNote.count ;
    }
    else if (self.type_CellDisplay == status_product)
    {
        return 8 ;
    }
    return 0 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.type_CellDisplay == status_note)
    {
        HPProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id_HPProductCollectionCell forIndexPath:indexPath];
        cell.noteItem = self.listNote[indexPath.row] ;
        return cell;
    }
    else if (self.type_CellDisplay == status_product)
    {
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
//    NoteDetailCtrller *detailCtrller = (NoteDetailCtrller *)[[self class] getCtrllerFromStory:@"HomePage" controllerIdentifier:@"NoteDetailCtrller"] ;
//    NSString *articleIDWillSend = nil ;
//    if (collectionView.collectionViewLayout == self.bplayout) {
//        NoteListViewItem *note = self.listNote[indexPath.section] ;
//        articleIDWillSend = note.articleId ;
//    }
//    else if (collectionView.collectionViewLayout == self.waterflowLayout) {
//        NoteListViewItem *note = self.listNote[indexPath.row] ;
//        articleIDWillSend = note.articleId ;
//    }
//    detailCtrller.articleId = articleIDWillSend ;
//    [detailCtrller setHidesBottomBarWhenPushed:YES] ;
//    [self.navigationController pushViewController:detailCtrller animated:YES] ;
    
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
