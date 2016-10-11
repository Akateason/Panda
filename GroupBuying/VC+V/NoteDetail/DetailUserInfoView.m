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
#import "UserOnDevice.h"

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
    
    if (!note) return ;
    
    _headImageView.hidden = false ;
    _btFoucus.hidden = false ;
    _labelName.hidden = false ;
    _lableTime.hidden = false ;
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:note.ownerHeadPic.qiniuUrl]
                      placeholderImage:IMG_HEAD_NO] ;
    _lableTime.text = [XTTickConvert timeInfoWithDate:[XTTickConvert getNSDateWithTick:note.articleInfo.createTime]] ;
    _labelName.text = note.ownerNickName ;
    
    if ([UserOnDevice hasLogin]) {
        _btFoucus.selected = note.isFollow ;
        _btFoucus.hidden = [UserOnDevice checkUserIsOwnerWithUserID:note.ownerId] ;
    }
    else {
        _btFoucus.selected = false ;
    }
    
}


- (IBAction)headOnClick:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(userheadOnClickWithUserID:userName:)]) {
        [self.delegate userheadOnClickWithUserID:_note.ownerId userName:_note.ownerNickName] ;
    }
    NSLog(@"头像") ;
}

- (IBAction)btFoucusOnClick:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(followUserBtOnClickWithCreaterID:followed:)]) {
        BOOL haslogin = [self.delegate followUserBtOnClickWithCreaterID:_note.ownerId followed:!sender.selected] ;
        if (!haslogin) return ;
        sender.selected = !sender.selected ;
    }
    NSLog(@"关注") ;
}



- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    _headImageView.hidden = true ;
    _btFoucus.hidden = true ;
    _labelName.hidden = true ;
    _lableTime.hidden = true ;
    
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
    self.contentView.backgroundColor = [UIColor whiteColor] ;
}








/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
