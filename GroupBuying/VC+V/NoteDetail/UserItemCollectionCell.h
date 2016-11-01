//
//  UserItemCollectionCell.h
//  GroupBuying
//
//  Created by teason on 16/9/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BigPhotoHeaderViewProtocolHeader.h"

static NSString *kID_UserItemCollectionCell = @"UserItemCollectionCell" ;

@class UserFollowViewItem ;


@interface UserItemCollectionCell : UICollectionViewCell
@property (nonatomic,weak) id <HPBigPhotoHeaderViewDelegate> delegate ;
@property (nonatomic,strong) UserFollowViewItem *followItem ;
@end
