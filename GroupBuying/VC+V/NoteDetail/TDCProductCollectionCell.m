//
//  TDCProductCollectionCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "TDCProductCollectionCell.h"

@interface TDCProductCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;

@end

@implementation TDCProductCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor whiteColor] ;
    _labelName.textColor = [UIColor xt_w_comment] ;
    _labelPrice.textColor = [UIColor xt_tabbarRedColor] ;
}


+ (CGSize)getSize
{
    // 374 / 500 = w / h
    float width  = ( APP_WIDTH - 3. ) / 2. ;
    float height = width * 500. / 374. ;
    
    return CGSizeMake(width, height) ;
}


@end
