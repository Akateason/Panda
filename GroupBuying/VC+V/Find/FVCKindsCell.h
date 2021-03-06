//
//  FVCKindsCell.h
//  GroupBuying
//
//  Created by teason on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_FVCKindsCell = @"FVCKindsCell" ;

typedef void(^Jump2Rank)(void);
typedef void(^Jump2HotProduct)(void) ;

@interface FVCKindsCell : UITableViewCell

@property (nonatomic,copy) Jump2Rank        blockRank ;
@property (nonatomic,copy) Jump2HotProduct  blockHotProduct ;

@end
