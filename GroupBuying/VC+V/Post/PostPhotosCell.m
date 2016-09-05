//
//  PostPhotosCell.m
//  GroupBuying
//
//  Created by TuTu on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PostPhotosCell.h"
#import "PostPhotoCollectionCell.h"
#import "PostAddPhotoCell.h"

@interface PostPhotosCell () <UICollectionViewDataSource,UICollectionViewDelegate,PostPhotoCollectionCellDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation PostPhotosCell


#pragma mark - PostPhotoCollectionCellDelegate
- (void)deleteImagesWithIndex:(int)index
{
    NSMutableArray *tmpList = [self.listPhotos mutableCopy] ;
    [tmpList removeObjectAtIndex:index] ;
    self.listPhotos = tmpList ;
    if (self.delegate) {
        [self.delegate deletePhotoWithList:self.listPhotos] ;
    }
    
    [_collectionView reloadData] ;
}

#pragma mark - prop
- (void)setListPhotos:(NSArray *)listPhotos
{
    _listPhotos = listPhotos ;
    
    [_collectionView reloadData] ;
}



#pragma mark - life
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Initialization code
    _collectionView.dataSource = self ;
    _collectionView.delegate = self ;
    _collectionView.backgroundColor = [UIColor whiteColor] ;
    [_collectionView registerNib:[UINib nibWithNibName:idPostPhotoCollectionCell bundle:nil] forCellWithReuseIdentifier:idPostPhotoCollectionCell] ;
    [_collectionView registerNib:[UINib nibWithNibName:idPostAddPhotoCell bundle:nil] forCellWithReuseIdentifier:idPostAddPhotoCell] ;
}



#pragma mark - collection dataSourse
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listPhotos.count + 1 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.listPhotos.count == indexPath.row) {
        PostAddPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:idPostAddPhotoCell forIndexPath:indexPath] ;
        return cell ;
    }
    else {
        PostPhotoCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:idPostPhotoCollectionCell forIndexPath:indexPath];
        cell.index = (int)indexPath.row ;
        cell.image = self.listPhotos[indexPath.row] ;
        cell.delegate = self ;
        return cell;
    }
    return nil ;
}

#pragma mark - collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.listPhotos.count == indexPath.row)
    {
        // click add .
        NSLog(@"add photo") ;
        if (self.delegate && [self.delegate respondsToSelector:@selector(addPhoto)])
        {
            [self.delegate addPhoto] ;
        }
    }
    else
    {
        // click photos
        NSLog(@"click photos") ;
    }
}










- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
