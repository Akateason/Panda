//
//  DetailTagsCell.m
//  GroupBuying
//
//  Created by teason on 16/9/18.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DetailTagsCell.h"

@interface DetailTagsCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIView *seperateline;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *baseline;

@end

@implementation DetailTagsCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _labelTitle.textColor = [UIColor xt_w_dark] ;
    _seperateline.backgroundColor = [UIColor xt_seperate] ;
    _baseline.backgroundColor = [UIColor xt_seperate] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
