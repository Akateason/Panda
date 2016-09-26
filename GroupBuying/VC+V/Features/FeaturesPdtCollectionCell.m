//
//  FeaturesPdtCollectionCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FeaturesPdtCollectionCell.h"

@interface FeaturesPdtCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation FeaturesPdtCollectionCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    _titleLabel.text = @"freeplus净润洗面霜" ;
    _priceLabel.text = @"¥ 199.00" ;
    
}

@end
