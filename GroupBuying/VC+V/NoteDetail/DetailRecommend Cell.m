//
//  DetailRecommend Cell.m
//  GroupBuying
//
//  Created by teason on 16/9/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DetailRecommend Cell.h"

@interface DetailRecommend_Cell ()
@property (weak, nonatomic) IBOutlet UIView *seperateline;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIButton *btMore;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *baseline;

@end

@implementation DetailRecommend_Cell

- (IBAction)btMoreOnClick:(id)sender {
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _seperateline.backgroundColor = [UIColor xt_seperate] ;
    _labelTitle.textColor = [UIColor xt_w_dark] ;
    [_btMore setTitleColor:[UIColor xt_w_light] forState:0] ;
    _baseline.backgroundColor = [UIColor xt_seperate] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
