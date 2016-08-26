//
//  HPBigPhotoHeaderView.h
//  GroupBuying
//
//  Created by TuTu on 16/8/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *id_HPBigPhotoHeaderView = @"HPBigPhotoHeaderView" ;

@protocol HPBigPhotoHeaderViewDelegate <NSObject>

- (void)userheadOnClick ;

@end


@interface HPBigPhotoHeaderView : UICollectionReusableView
@property (nonatomic,weak) id <HPBigPhotoHeaderViewDelegate> delegate ;
@property (nonatomic) int index ;

@end
