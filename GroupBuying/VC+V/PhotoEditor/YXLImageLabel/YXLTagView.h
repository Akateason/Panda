
#import <UIKit/UIKit.h>
#import "YXLWaterFlowImageView.h"
#import "Masonry.h"


@interface YXLTagView : UIView

// 判断是否是正向和反向 NO and YES
@property (nonatomic ,assign) BOOL isPositiveAndNegative;

// 标签图片 + 文本
@property (nonatomic ,strong) YXLWaterFlowImageView *imageLabel;

// 最开始点击是不显示标签图片只显示一个点  默认NO : 不显示标签 NO And 显示 YES
@property (nonatomic ,assign) BOOL isImageLabelShow;

// 标签类型 .
@property (nonatomic,copy) NSString *typeStr ;


@end
