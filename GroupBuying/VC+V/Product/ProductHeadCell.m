//
//  ProductHeadCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/28.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ProductHeadCell.h"
#import "NSString+Extend.h"
#import "XTLoopScrollView.h"

@interface ProductHeadCell ()
@property (weak, nonatomic) IBOutlet UIView *loopContainer; // 商品轮播图容器
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UIView *seperateLine;
@property (weak, nonatomic) IBOutlet UILabel *labelTaxAndFrieght;
@property (weak, nonatomic) IBOutlet UIView *bottomLine;

@property (nonatomic,strong) XTLoopScrollView *loopScrollView ;
@end

@implementation ProductHeadCell

- (XTLoopScrollView *)loopScrollView
{
    if (!_loopScrollView) {
        _loopScrollView = [[XTLoopScrollView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, APP_WIDTH / 75. * 90.)
                                                          canLoop:YES
                                                         duration:3.] ;
    }
    return _loopScrollView ;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _loopContainer.backgroundColor = [UIColor whiteColor] ;
    _labelName.textColor = [UIColor xt_w_light] ;
    _labelPrice.textColor = [UIColor xt_tabbarRedColor] ;
    _seperateLine.backgroundColor = [UIColor xt_seperate] ;
    _labelTaxAndFrieght.textColor = [UIColor xt_w_light] ;
    _bottomLine.backgroundColor = [UIColor xt_seperate] ;
    
    [_loopContainer addSubview:self.loopScrollView] ;
    self.loopScrollView.imglist = @[@"1",@"2",@"3"] ;
}

+ (CGFloat)calculateHeightWithProductName:(NSString *)name
{
    float imgContainerHeight = APP_WIDTH / 75. * 90. ;
    float nameHeight = [name calculateWithOverSize:CGSizeMake(APP_WIDTH - 12.0 * 2, 200)
                                    systemFontSize:12.].height ;
    return imgContainerHeight + 8 + 10 + 14 + 22 + 1 + 10 + 15 + 14 + 15 + nameHeight ;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
