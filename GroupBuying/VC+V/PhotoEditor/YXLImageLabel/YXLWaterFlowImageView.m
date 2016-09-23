

#import "YXLWaterFlowImageView.h"

@implementation YXLWaterFlowImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame] ;
    if (self)
    {
        self.layer.masksToBounds = YES ;
        _labelWaterFlow = [[UILabel alloc] init] ;
        _labelWaterFlow.font = Font(11) ;
        _labelWaterFlow.textColor = [UIColor whiteColor] ;
        _labelWaterFlow.textAlignment = NSTextAlignmentCenter ;
        [self addSubview:_labelWaterFlow] ;
        [_labelWaterFlow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 10, 0, 5)) ;
        }];
    }
    return self;
}

@end
