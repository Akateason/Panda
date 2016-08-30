//
//  PostTagCell.m
//  GroupBuying
//
//  Created by TuTu on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PostTagCell.h"
#import "PostTagItemCollectionCell.h"
#import "PostTagAddCollectionCell.h"

@interface PostTagCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIButton *btSaveDraft;

@end

@implementation PostTagCell

- (IBAction)btSaveDraftOnClick:(id)sender
{
    NSLog(@"保存至草稿箱") ;
    if (self.delegate && [self.delegate respondsToSelector:@selector(saveDraft)])
    {
        [self.delegate saveDraft] ;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _labelTitle.textColor = [UIColor xt_w_desc] ;
    [_btSaveDraft setTitleColor:[UIColor xt_w_gray] forState:0] ;
    
    _collectionView.backgroundColor = [UIColor whiteColor] ;
    _collectionView.delegate = self ;
    _collectionView.dataSource = self ;
    [_collectionView registerNib:[UINib nibWithNibName:idPostTagAddCollectionCell bundle:nil] forCellWithReuseIdentifier:idPostTagAddCollectionCell] ;
    [_collectionView registerNib:[UINib nibWithNibName:idPostTagItemCollectionCell bundle:nil] forCellWithReuseIdentifier:idPostTagItemCollectionCell] ;
}




#pragma mark - collection dataSourse
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1 + self.listTags.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.listTags.count == indexPath.row) {
        PostTagAddCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:idPostTagAddCollectionCell forIndexPath:indexPath] ;
        return cell ;
    }
    else {
        PostTagItemCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:idPostTagItemCollectionCell forIndexPath:indexPath];
        
        return cell;
    }
    return nil ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.listTags.count == indexPath.row)
    {
        NSLog(@"add tag .") ;
        if (self.delegate && [self.delegate respondsToSelector:@selector(addTag)])
        {
            [self.delegate addTag] ;
        }
    }
    else
    {
        NSLog(@"tags click") ;
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.listTags.count == indexPath.row) {
        // (@"add tag .") ;
        return CGSizeMake(74., 30.) ;
    }
    else {
        // (@"tags click") ;
        return [PostTagItemCollectionCell getSizeWithTagName:@"呵呵哒"] ;
    }
    return CGSizeZero ;
}








- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
