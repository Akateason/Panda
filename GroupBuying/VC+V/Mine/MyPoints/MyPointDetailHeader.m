//
//  MyPointDetailHeader.m
//  GroupBuying
//
//  Created by TuTu on 16/10/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyPointDetailHeader.h"

@implementation MyPointDetailHeader

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier] ;
    if (self) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(12, kHeight_MyPointDetailHeader - 12. - 5., 50, 12.)] ;
        label.text = @"积分明细" ;
        label.font = [UIFont systemFontOfSize:12] ;
        label.textColor = [UIColor xt_w_dark] ;
        [self addSubview:label] ;
    }
    return self ;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
