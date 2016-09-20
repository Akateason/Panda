//
//  CommentCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "CommentCell.h"
#import "UIImage+Addfunction.h"
#import "Comment.h"
#import "UIImageView+WebCache.h"
#import "XTTickConvert.h"
#import "NSString+Extend.h"

@interface CommentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userHead;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@end

@implementation CommentCell


+ (CGFloat)calculateHeight:(Comment *)comment
{
    CGSize size = CGSizeMake(APP_WIDTH - 64. - 12., 300.) ;
    CGSize labelSize = [comment.content calculateWithOverSize:size systemFontSize:14.] ;
    float contentHeight = labelSize.height ;
    
    return  67. + contentHeight + 9. ;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _userHead.layer.cornerRadius = _userHead.frame.size.width / 2. ;
    _userHead.layer.masksToBounds = YES ;
    
    _nameLabel.textColor = [UIColor xt_mainColor] ;
    _timeLabel.textColor = [UIColor xt_w_light] ;
    _commentLabel.textColor = [UIColor xt_w_comment] ;
}


- (void)setAComment:(Comment *)aComment
{
    _aComment = aComment ;
    
    if (!aComment) return ;
    
    
    _userHead.image = IMG_HEAD_NO ;
//    [_userHead sd_setImageWithURL:[NSURL URLWithString:aComment.]
//                 placeholderImage:IMG_HEAD_NO] ;
    _nameLabel.text = aComment.createName ;
    _timeLabel.text = [XTTickConvert getDateWithTick:aComment.createTime AndWithFormart:TIME_STR_FORMAT_3] ;
    _commentLabel.text = aComment.content ;
}








- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
