//
//  ProductHeadCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/28.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ProductHeadCell.h"

@interface ProductHeadCell ()
@property (weak, nonatomic) IBOutlet UIView *loopContainer;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UIView *seperateLine;
@property (weak, nonatomic) IBOutlet UILabel *labelTaxAndFrieght;
@property (weak, nonatomic) IBOutlet UIView *bottomLine;
@end

@implementation ProductHeadCell

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
}

+ (CGFloat)calculateHeightWithProductName:(NSString *)name
{
    return 508.0f ;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
