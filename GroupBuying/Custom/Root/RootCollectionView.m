//
//  RootCollectionView.m
//  GroupBuying
//
//  Created by TuTu on 16/8/23.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RootCollectionView.h"
#import "LoadingImagesHeader.h"
#import "MJRefresh.h"


@interface RootCollectionView ()
@property (nonatomic,strong) NSArray *gifImageList ;
@end

@implementation RootCollectionView

#pragma mark --
#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout] ;
    if (self) {
        [self setup] ;
    }
    return self ;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup] ;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup] ;
    }
    return self;
}

- (void)setup
{
    [self MJRefreshConfigure] ;
    [self defaultPublicAPIs] ;
}


- (void)MJRefreshConfigure
{
    NSArray *idleImages = self.gifImageList ; //@[[self.gifImageList firstObject]] ;
    NSArray *pullingImages = self.gifImageList ;
    NSArray *refreshingImages = self.gifImageList ;
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDataSelector)];
    [header setImages:idleImages forState:MJRefreshStateIdle];
    [header setImages:pullingImages forState:MJRefreshStatePulling];
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
    self.mj_header = header;
    
    MJRefreshBackGifFooter *footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataSelector)];
    [footer setImages:idleImages forState:MJRefreshStateIdle];
    [footer setImages:pullingImages forState:MJRefreshStatePulling];
    [footer setImages:refreshingImages forState:MJRefreshStateRefreshing];
    self.mj_footer = footer;
}

- (void)defaultPublicAPIs
{
    self.showRefreshDetail = NO ;
    self.automaticallyLoadMore = NO ;
    self.automaticallyLoadNew = YES ;
}

#pragma mark --
#pragma mark - Public Properties
- (void)setShowRefreshDetail:(BOOL)showRefreshDetail
{
    _showRefreshDetail = showRefreshDetail ;
    
    ((MJRefreshGifHeader *)self.mj_header).lastUpdatedTimeLabel.hidden = !self.showRefreshDetail;
    ((MJRefreshGifHeader *)self.mj_header).stateLabel.hidden = !self.showRefreshDetail ;
    ((MJRefreshBackGifFooter *)self.mj_footer).stateLabel.hidden = !self.showRefreshDetail ;
}

- (void)setAutomaticallyLoadMore:(BOOL)automaticallyLoadMore
{
    _automaticallyLoadMore = automaticallyLoadMore ;
    
    if (_automaticallyLoadMore)
    {
        self.mj_footer = nil ;
        MJRefreshAutoFooter *autofooter = [MJRefreshAutoFooter footerWithRefreshingTarget:self
                                                                         refreshingAction:@selector(loadMoreDataSelector)] ;
        autofooter.triggerAutomaticallyRefreshPercent = 0.55 ;
        self.mj_footer = autofooter;
    }
}

- (void)setAutomaticallyLoadNew:(BOOL)automaticallyLoadNew
{
    _automaticallyLoadNew = automaticallyLoadNew ;
    
    if (_automaticallyLoadNew) {
        [self.mj_header beginRefreshing] ;
    } else {
        [self.mj_header endRefreshing] ;
    }
}

#pragma mark - Private
- (NSArray *)gifImageList
{
    if (!_gifImageList)
    {
        NSMutableArray *tempList = [NSMutableArray array] ;
        for (int i = 0; i < TABLE_HEADER_IMAGES_COUNT; i++)
        {
            UIImage *imgTemp = [UIImage imageNamed:[NSString stringWithFormat:@"%@%d",TABLE_HEADER_IMAGES,i]] ;
            [tempList addObject:imgTemp] ; // DEFAULT MODE IS THIS GIF IMAGES .
        }
        _gifImageList = [NSArray arrayWithArray:tempList] ;
    }
    
    return _gifImageList ;
}

#pragma mark --
#pragma mark - loading methods
- (void)loadNewDataSelector
{
    [self.xt_delegate loadNewData] ;
    [self headerEnding] ;
}

- (void)headerEnding
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
        [self.mj_header endRefreshing];
    }) ;
}

- (void)loadMoreDataSelector
{
    if (_automaticallyLoadMore)
    {
        dispatch_queue_t queue = dispatch_queue_create("refreshAutoFooter", NULL) ;
        dispatch_async(queue, ^{
            [self.xt_delegate loadMoreData] ;
            [self footerEnding] ;
        }) ;
        
        return ;
    }
    else
    {
        [self.xt_delegate loadMoreData] ;
    }
    
    [self footerEnding] ;
}

- (void)footerEnding
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
        [self.mj_footer endRefreshing];
    }) ;
}


#pragma mark --
#pragma mark - Public
- (void)pullDownRefreshHeader
{
    [self.mj_header beginRefreshing] ;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
