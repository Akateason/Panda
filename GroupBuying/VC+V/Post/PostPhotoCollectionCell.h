//
//  PostPhotoCollectionCell.h
//  GroupBuying
//
//  Created by TuTu on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *idPostPhotoCollectionCell = @"PostPhotoCollectionCell" ;



@protocol PostPhotoCollectionCellDelegate <NSObject>

- (void)deleteImagesWithIndex:(int)index ;

@end


@interface PostPhotoCollectionCell : UICollectionViewCell

@property (nonatomic,weak) id <PostPhotoCollectionCellDelegate> delegate ;
@property (nonatomic,strong) UIImage *image ;
@property (nonatomic)        int     index ;

@end
