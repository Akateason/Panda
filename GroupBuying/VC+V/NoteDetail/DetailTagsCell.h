//
//  DetailTagsCell.h
//  GroupBuying
//
//  Created by teason on 16/9/18.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TagClick)(NSString *tagStr) ;

static NSString *const kID_DetailTagsCell = @"DetailTagsCell" ;

@interface DetailTagsCell : UITableViewCell

@property (nonatomic,strong) NSArray *tags ;
@property (nonatomic,copy) TagClick clickTagBlock ;

+ (CGFloat)calculateHeight:(NSArray *)tags ;

@end
