//
//  DetailUserInfoView.h
//  GroupBuying
//
//  Created by teason on 16/9/10.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BigPhotoHeaderViewProtocolHeader.h"

static NSString *const kID_DetailUserInfoView = @"DetailUserInfoView" ;

@class NoteDetailViewItem ;

@interface DetailUserInfoView : UITableViewHeaderFooterView

@property (nonatomic,weak)   id <HPBigPhotoHeaderViewDelegate> delegate ;
@property (nonatomic,strong) NoteDetailViewItem *note ;

@end
