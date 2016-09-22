//
//  DetailUserInfoView.m
//  GroupBuying
//
//  Created by teason on 16/9/10.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DetailUserInfoView.h"
#import "UIImageView+WebCache.h"
#import "NoteDetailViewItem.h"
#import "Pic.h"
#import "XTTickConvert.h"
#import "Article.h"

@interface DetailUserInfoView ()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIButton *btFoucus;
@property (weak, nonatomic) IBOutlet UILabel *lableTime;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@end

@implementation DetailUserInfoView

- (void)setNote:(NoteDetailViewItem *)note
{
    _note = note ;
    
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:note.ownerHeadPic.qiniuUrl]
                      placeholderImage:IMG_HEAD_NO] ;
    _btFoucus.hidden = note.isFollow ;
    _lableTime.text = [XTTickConvert timeInfoWithDate:[XTTickConvert getNSDateWithTick:note.articleInfo.createTime]] ;
    _labelName.text = note.ownerNickName ;
}


- (IBAction)headOnClick:(id)sender
{
    NSLog(@"头像") ;
}

- (IBAction)btFoucusOnClick:(UIButton *)sender
{
    NSLog(@"关注") ;
    sender.selected = !sender.selected ;
}



- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    [_btFoucus setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btFoucus.layer.cornerRadius = 5. ;
    _btFoucus.layer.borderWidth = 1. ;
    _btFoucus.layer.borderColor = [UIColor xt_w_dark].CGColor ;
    _btFoucus.tintColor = [UIColor xt_w_dark] ;
    
    _headImageView.layer.cornerRadius = _headImageView.frame.size.width / 2. ;
    _headImageView.layer.masksToBounds = YES ;
    
    _lableTime.textColor =  [UIColor xt_w_light] ;
    _labelName.textColor = [UIColor xt_w_dark] ;
    
    UIView *bView = [[UIView alloc] initWithFrame:self.frame] ;
    bView.backgroundColor = [UIColor whiteColor] ;
    self.backgroundView = bView ;
}








/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
