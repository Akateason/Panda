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
#import "XTTickConvert.h"
#import "NSString+Extend.h"
#import "UIImageView+SDQN.h"
#import "Pic.h"
#import "Comment+Reply.h"

@interface CommentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userHead;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIView *topline;

@end

@implementation CommentCell

- (void)tapHeadAction:(UITapGestureRecognizer *)sender
{
    NSLog(@"tap head") ;
    if (self.blockTapHead != nil) {
        self.blockTapHead(self.aComment.createrId) ;
    }
}

- (void)tapCommentAction:(UITapGestureRecognizer *)sender
{
    NSLog(@"tap cmt") ;
    if (self.blockReply != nil) {
        self.blockReply(self.aComment.createrName) ;
    }
}

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
    _topline.backgroundColor = [UIColor xt_seperate] ;
    
    _userHead.layer.cornerRadius = _userHead.frame.size.width / 2. ;
    _userHead.layer.masksToBounds = YES ;
    
    _nameLabel.textColor = [UIColor xt_tabbarRedColor] ;
    _timeLabel.textColor = [UIColor xt_w_light] ;
    _commentLabel.textColor = [UIColor xt_w_comment] ;
    
    UITapGestureRecognizer *tapHeadGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHeadAction:)] ;
    [_userHead addGestureRecognizer:tapHeadGesture] ;
    
    UITapGestureRecognizer *tapCommentGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCommentAction:)] ;
    [_commentLabel addGestureRecognizer:tapCommentGesture] ;
}


- (void)setAComment:(Comment *)aComment
{
    _aComment = aComment ;
    
    if (!aComment) return ;
    
    [_userHead xt_setCircleImageWithPic:aComment.createrHead placeHolderImage:IMG_HEAD_NO] ;    

    _nameLabel.text = aComment.createrName ;
    _timeLabel.text = [XTTickConvert getDateWithTick:aComment.createTime AndWithFormart:TIME_STR_FORMAT_3] ;
    _commentLabel.attributedText = [aComment replyDisplayString] ;
}








- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
