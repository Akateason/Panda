//
//  DetailTagsCell.m
//  GroupBuying
//
//  Created by teason on 16/9/18.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DetailTagsCell.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "PostTagAddCollectionCell.h"


@interface DetailTagsCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIView *seperateline;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *baseline;

@end

@implementation DetailTagsCell

static float kSingleRowHeight   =   30. ;
#define      rowMaxWidth            APP_WIDTH - 2 * 10.
#define      tagFont                [UIFont systemFontOfSize:12.]


+ (CGFloat)calculateHeight:(NSArray *)tags
{
    if (!tags || !tags.count) return 0. ;
    
    CGFloat plusWidth = 0 ;
    int howmanyRows = 1 ;
    for (int i = 0 ; i < tags.count ; i++)
    {
        NSString *str = tags[i] ;
        NSString *tagStr = [@"#" stringByAppendingString:str] ;
        CGFloat tagsWidth = [self getTagsWidWithTagStr:tagStr] ;
        plusWidth += (tagsWidth + 10) ;
        if (plusWidth > rowMaxWidth)
        {
            plusWidth = (tagsWidth + 10) ;
            howmanyRows ++ ;
        }
    }
    
    CGFloat collectionViewHeight = howmanyRows * kSingleRowHeight ;
    return 42. + collectionViewHeight + 15. ;
}

+ (CGFloat)getTagsWidWithTagStr:(NSString *)tagStr
{
    CGSize size = CGSizeMake(rowMaxWidth, 30) ;
    CGSize labelSize = [tagStr boundingRectWithSize:size
                                            options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                         attributes:@{NSFontAttributeName:tagFont}
                                            context:nil].size ;
    CGFloat tagsWidth = labelSize.width ;
    return tagsWidth + 9. * 2;
}



- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _labelTitle.textColor = [UIColor xt_w_dark] ;
    _seperateline.backgroundColor = [UIColor xt_seperate] ;
    _baseline.backgroundColor = [UIColor xt_seperate] ;
    
    UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc] init];
    _collectionView.backgroundColor = [UIColor whiteColor] ;
    _collectionView.dataSource = self ;
    _collectionView.delegate = self ;
    _collectionView.collectionViewLayout = layout ;
    [_collectionView registerNib:[UINib nibWithNibName:idPostTagAddCollectionCell bundle:nil] forCellWithReuseIdentifier:idPostTagAddCollectionCell] ;
}


#pragma mark - collection dataSourse

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tags.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PostTagAddCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:idPostTagAddCollectionCell forIndexPath:indexPath] ;
    cell.strDisplay = self.tags[indexPath.row] ;
    return cell ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select tag") ;
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = self.tags[indexPath.row] ;
    return CGSizeMake([[self class] getTagsWidWithTagStr:str], kSingleRowHeight) ;
}








- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
