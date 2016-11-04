//
//  SearchConditionView.m
//  GroupBuying
//
//  Created by TuTu on 16/11/4.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "SearchConditionView.h"

@implementation SearchConditionView

- (void)showInView:(UIView *)fromView
{
    [fromView addSubview:self] ;
}

- (void)dismiss
{
    [self removeFromSuperview] ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5] ;
        UIButton *bgButton = [[UIButton alloc] initWithFrame:frame] ;
        [bgButton addTarget:self action:@selector(tapBackground) forControlEvents:UIControlEventTouchUpInside] ;
        [self addSubview:bgButton] ;
        
        self.schTable = [[SearchConditionTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain] ;
//        [self.schTable setListConditions:@[@"综合排序",@"按时间",@"按热度"]] ;  // 在外部调用
        [self addSubview:self.schTable] ;
    }
    return self;
}

- (void)tapBackground
{
    [self dismiss] ;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
