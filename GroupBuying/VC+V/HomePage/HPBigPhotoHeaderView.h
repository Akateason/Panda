//
//  HPBigPhotoHeaderView.h
//  GroupBuying
//
//  Created by TuTu on 16/8/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BigPhotoHeaderViewProtocolHeader.h"

@class NoteListViewItem ;

static NSString *id_HPBigPhotoHeaderView = @"HPBigPhotoHeaderView" ;

@interface HPBigPhotoHeaderView : UICollectionReusableView

@property (nonatomic,weak) id <HPBigPhotoHeaderViewDelegate> delegate ;
@property (nonatomic) int index ;
@property (nonatomic,strong) NoteListViewItem *noteItem ;

@end
