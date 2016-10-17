//
//  MineEditHeadCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MineEditHeadCell.h"
#import "Pic.h"
#import "UIImageView+SDQN.h"

@interface MineEditHeadCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgHead;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation MineEditHeadCell

- (void)setHeadPic:(Pic *)headPic
{
    _headPic = headPic ;
    
    if (!headPic) return ;
    
    [_imgHead xt_setImageWithPic:headPic placeHolderImage:IMG_HEAD_NO] ;
}



- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    _imgHead.layer.cornerRadius = _imgHead.frame.size.width / 2. ;
    _imgHead.layer.masksToBounds = YES ;
    _titleLabel.textColor = [UIColor xt_w_dark] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
