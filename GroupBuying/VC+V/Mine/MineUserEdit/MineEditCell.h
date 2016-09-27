//
//  MineEditCell.h
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_MineEditCell = @"MineEditCell" ;

@interface MineEditCell : UITableViewCell

@property (nonatomic,copy) NSString *strTitle ;
@property (nonatomic,copy) NSString *strValue ;

@end
