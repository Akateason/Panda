//
//  DetailCoverTitleCell.m
//  GroupBuying
//
//  Created by teason on 16/9/10.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DetailCoverTitleCell.h"

@interface DetailCoverTitleCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptLabel;
@property (weak, nonatomic) IBOutlet UIView *sepline;

@end


@implementation DetailCoverTitleCell

+ (CGFloat)getHeight
{
    return APP_WIDTH * 500. / 374. ; //imgH + title + descrp +sep
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
