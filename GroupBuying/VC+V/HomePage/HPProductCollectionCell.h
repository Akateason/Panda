//
//  HPProductCollectionCell.h
//  GroupBuying
//
//  Created by teason on 16/8/18.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageCollectionCellHeader.h"
@class NoteListViewItem ;

static NSString *id_HPProductCollectionCell = @"HPProductCollectionCell" ;


@interface HPProductCollectionCell : UICollectionViewCell

@property (nonatomic) int  index ;

@property (nonatomic,strong)  NoteListViewItem *noteItem ;
@property (nonatomic,weak) id <HomePageCollectionCellDelegate> delegate ;
+ (CGSize)getSize ;

@end
