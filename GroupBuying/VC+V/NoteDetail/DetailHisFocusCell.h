//
//  DetailHisFocusCell.h
//  GroupBuying
//
//  Created by teason on 16/9/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BigPhotoHeaderViewProtocolHeader.h"

static NSString *kID_DetailHisFocusCell = @"DetailHisFocusCell" ;
static float    kHeight_HisFocusCell    = 166. ;


@interface DetailHisFocusCell : UITableViewCell
@property (nonatomic,weak) id <HPBigPhotoHeaderViewDelegate> delegate ;
@property (nonatomic,strong) NSArray *listFollowers ;
@property (nonatomic,copy) (void)(^moreBtBlock(void)) ;
@end
