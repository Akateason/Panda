//
//  FVCBannerCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FVCBannerCell.h"

@implementation FVCBannerCell

+ (CGFloat)getHeight
{
    return APP_WIDTH * 35. / 75. ;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
}










- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
