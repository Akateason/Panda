//
//  FVCKindCollectionCell.h
//  GroupBuying
//
//  Created by teason on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_FVCKindCollectionCell = @"FVCKindCollectionCell" ;

@interface FVCKindCollectionCell : UICollectionViewCell

@property (nonatomic,strong) NSString *str ;
@property (nonatomic)        int      index ;

@end
