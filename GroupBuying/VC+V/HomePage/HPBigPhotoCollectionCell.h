//
//  HPBigPhotoCollectionCell.h
//  GroupBuying
//
//  Created by teason on 16/8/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NoteListViewItem ;

static NSString *id_HPBigPhotoCollectionCell = @"HPBigPhotoCollectionCell" ;

@interface HPBigPhotoCollectionCell : UICollectionViewCell

@property (nonatomic,strong) NoteListViewItem *noteItem ;

+ (CGSize)getSizeWithTitleStr:(NSString *)titleStr ;

@end
