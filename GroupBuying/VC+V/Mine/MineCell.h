//
//  MineCell.h
//  GroupBuying
//
//  Created by teason on 16/9/23.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CellDisplayType) {
    MineCell_typeDefault = 0 ,
    MineCell_typeMessage,
};

static NSString *const kID_MineCell = @"MineCell" ;

@interface MineCell : UITableViewCell

@property (nonatomic) BOOL              hasNewMessage ;  // default is false
@property (nonatomic) CellDisplayType   typeOfCell ;     // default is 0

- (void)setupCellWithList:(NSArray *)list ;

@end
