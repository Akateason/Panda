//
//  DetailPicCollectionCell.h
//  GroupBuying
//
//  Created by TuTu on 16/11/1.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ArticlePicItem ;

static NSString *const kID_DetailPicCollectionCell = @"DetailPicCollectionCell" ;

@interface DetailPicCollectionCell : UICollectionViewCell
@property (nonatomic,strong) ArticlePicItem *picItem ;
@end
