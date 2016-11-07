//
//  MyActivityCell.m
//  GroupBuying
//
//  Created by TuTu on 16/11/7.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MyActivityCell.h"

@interface MyActivityCell ()
@property (weak, nonatomic) IBOutlet UILabel *lbStatus;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewActivity;
@end

@implementation MyActivityCell

- (void)setIndex:(int)index
{
    _index = index ;
    
    _imgViewActivity.image = [UIImage imageNamed:[NSString stringWithFormat:@"banner%d",index+1]] ;
    _lbStatus.text = index % 2 ? @"正在进行" : @"已结束" ;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)getHeight
{
    return 35. + APP_WIDTH * 52. / 75. ;
}

@end
