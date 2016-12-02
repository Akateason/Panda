//
//  PDVCSegmentHeaderView.m
//  GroupBuying
//
//  Created by TuTu on 16/12/2.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PDVCSegmentHeaderView.h"
#import "XTSegment.h"

@interface PDVCSegmentHeaderView () <XTSegmentDelegate>
@property (nonatomic,strong) XTSegment *segment ;
@end

@implementation PDVCSegmentHeaderView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        [self segment] ;
    }
    return self ;
}

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier] ;
    if (self) {
        [self segment] ;
    }
    return self ;
}




- (XTSegment *)segment
{
    if (!_segment) {
        _segment = [[XTSegment alloc] initWithDataList:@[@"产品详情",@"产品评价"]
                                                 imgBg:[UIImage imageNamed:@"btBase"]
                                                height:kHeight_PDVCSegmentHeaderView
                                           normalColor:[UIColor xt_w_light]
                                           selectColor:[UIColor xt_tabbarRedColor]
                                                  font:[UIFont systemFontOfSize:13.]
                                                 frame:APPFRAME] ;
        _segment.backgroundColor = [UIColor whiteColor] ;
        _segment.delegate = self ;
        _segment.frame = CGRectMake(0, 0, APP_WIDTH, kHeight_PDVCSegmentHeaderView) ;
        if (!_segment.superview) {
            [self addSubview:_segment] ;
        }
    }
    return _segment ;
}

#pragma mark - XTSegmentDelegate
- (void)clickSegmentWith:(int)index
{
    NSLog(@"idx : %d",index) ;    // 切换 segment
    
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
