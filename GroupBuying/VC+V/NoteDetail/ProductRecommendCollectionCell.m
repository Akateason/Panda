//
//  ProductRecommendCollectionCell.m
//  GroupBuying
//
//  Created by teason on 16/9/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ProductRecommendCollectionCell.h"

@interface ProductRecommendCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameTitle;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation ProductRecommendCollectionCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _productNameTitle.textColor = [UIColor xt_w_dark] ;
    _priceLabel.textColor = [UIColor xt_w_desc] ;
    _productImageView.layer.borderWidth = 1. ;
    _productImageView.layer.borderColor = [UIColor xt_seperate].CGColor ;
    _productImageView.layer.masksToBounds = YES ;
    
    _productNameTitle.text = @"freeplus净润洗面霜" ;
    _priceLabel.text = @"¥ 199.00" ;
}

@end
