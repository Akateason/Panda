//
//  DetailCoverTitleCell.m
//  GroupBuying
//
//  Created by teason on 16/9/10.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DetailCoverTitleCell.h"
#import "NoteDetailViewItem.h"
#import "Article.h"
#import "Pic.h"
#import "MaxShapeView.h"
#import "MaxLightingView.h"
#import "Article.h"
#import "ArticlePicItem.h"
#import "ArticlePicItemInfo.h"
#import "Pic.h"
#import "DetailPicCollectionCell.h"

#define kLABELNUMBER_RECT       CGRectMake(_imgContainer.frame.size.width - 15 - 35, _imgContainer.frame.size.height - 10 - 18, 35., 18.)

@interface DetailCoverTitleCell () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *imgContainer;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptLabel;
@property (weak, nonatomic) IBOutlet UIView *sepline;

// code
@property (nonatomic,strong) UICollectionView *collectionView ;
@property (nonatomic,strong) UILabel          *labelNumber ;

@end


@implementation DetailCoverTitleCell

#pragma mark - util
+ (CGFloat)getHeightWithNoteItem:(NoteDetailViewItem *)noteItem
{
    float imgH = APP_WIDTH * 500. / 374. ;
    
    CGFloat titleHeight = 0.;
    if (noteItem.articleInfo.title.length)
    {
        UIFont *fontTitle = [UIFont systemFontOfSize:14] ;
        CGSize sizeTitle = CGSizeMake(APP_WIDTH - 2 * 12., 100.) ;
        CGSize titlelabelSize = [noteItem.articleInfo.title boundingRectWithSize:sizeTitle
                                                                         options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                                      attributes:@{NSFontAttributeName:fontTitle}
                                                                         context:nil].size ;
        titleHeight = titlelabelSize.height ;
    }
    

    UIFont *fontContent= [UIFont systemFontOfSize:13] ;
    CGSize sizeContent = CGSizeMake(APP_WIDTH - 2 * 12., 1000.) ;
    CGSize contentLabelSize = [noteItem.articleInfo.content boundingRectWithSize:sizeContent
                                                                     options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                                  attributes:@{NSFontAttributeName:fontContent}
                                                                     context:nil].size ;
    CGFloat contentHeight = contentLabelSize.height ;
    
    
    return imgH + 10. + titleHeight + 14 + contentHeight + 10 + 15 ;
}

#pragma mark - prop
- (void)setNoteItem:(NoteDetailViewItem *)noteItem
{
    _noteItem = noteItem ;
    
    if (!noteItem) return ;
    
    _titleLabel.text = noteItem.articleInfo.title ;
    _descriptLabel.text = noteItem.articleInfo.content ;
    [_collectionView reloadData] ;
    _labelNumber.hidden = (noteItem.articleInfo.picItems.count <= 1) ;
    if (noteItem.articleInfo.picItems.count > 1) {
        _labelNumber.text = [NSString stringWithFormat:@"1/%@",@(self.noteItem.articleInfo.picItems.count)] ;
    }
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        CGRect rect = CGRectZero ;
        rect.size = CGSizeMake(APP_WIDTH, APP_WIDTH * 1000 / 750) ;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init] ;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal ;
        layout.minimumLineSpacing = 0 ;
        layout.minimumInteritemSpacing = 0 ;
        _collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout] ;
        _collectionView.backgroundColor = [UIColor whiteColor] ;
        _collectionView.pagingEnabled = YES ;
        _collectionView.bounces = NO ;
        _collectionView.showsHorizontalScrollIndicator = NO ;
        [_collectionView registerNib:[UINib nibWithNibName:kID_DetailPicCollectionCell bundle:nil] forCellWithReuseIdentifier:kID_DetailPicCollectionCell] ;
        _collectionView.delegate = self ;
        _collectionView.dataSource = self ;
    }
    return _collectionView ;
}


- (UILabel *)labelNumber
{
    if (!_labelNumber) {
        _labelNumber = [[UILabel alloc] init] ;
        _labelNumber.font = [UIFont systemFontOfSize:11.] ;
        _labelNumber.textColor = [UIColor xt_w_dark] ;
        _labelNumber.backgroundColor = [UIColor whiteColor] ;
        _labelNumber.textAlignment = NSTextAlignmentCenter ;
        _labelNumber.layer.cornerRadius = 3. ;
        _labelNumber.layer.masksToBounds = YES ;
    }
    return _labelNumber ;
}

#pragma mark - life

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor whiteColor] ;
    _imgContainer.backgroundColor = [UIColor whiteColor] ;
    
    // Initialization code
    _titleLabel.textColor = [UIColor xt_w_dark] ;
    _descriptLabel.textColor = [UIColor xt_w_content] ;
    _sepline.backgroundColor = [UIColor xt_seperate] ;
    // collection add
    [_imgContainer addSubview:self.collectionView] ;
    [_imgContainer addSubview:self.labelNumber] ;
}

- (void)layoutSubviews
{
    [super layoutSubviews] ;
    
    self.labelNumber.frame = kLABELNUMBER_RECT ;
}




#pragma mark - collection dataSourse

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.noteItem.articleInfo.picItems.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailPicCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID_DetailPicCollectionCell forIndexPath:indexPath] ;
    cell.picItem = self.noteItem.articleInfo.picItems[indexPath.row] ;
    return cell ;
}

#pragma mark - collection delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(APP_WIDTH, APP_WIDTH * 1000 / 750) ;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWith = APP_WIDTH ;
    int page = floor((scrollView.contentOffset.x - pageWith / 2) / pageWith) + 1 ;
    self.labelNumber.text = [NSString stringWithFormat:@"%@/%@",@(page + 1),@(self.noteItem.articleInfo.picItems.count)] ;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
