//
//  CartCell.h
//  GroupBuying
//
//  Created by TuTu on 16/10/8.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_CartCell = @"CartCell" ;
static const float kHeight_CartCell = 201. ;


@protocol ProductProtocol <NSObject>
- (void)productOnClick ;
@end

@interface CartCell : UITableViewCell

@property (nonatomic,weak) id <ProductProtocol> pdtDelegate ;

@end
