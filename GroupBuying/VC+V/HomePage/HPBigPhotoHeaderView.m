//
//  HPBigPhotoHeaderView.m
//  GroupBuying
//
//  Created by TuTu on 16/8/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HPBigPhotoHeaderView.h"
#import "NoteListViewItem.h"
#import "UIImageView+SDQN.h"
#import "XTTickConvert.h"
#import "Pic.h"
#import "UserOnDevice.h"

@interface HPBigPhotoHeaderView ()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIButton *btFoucus;
@property (weak, nonatomic) IBOutlet UILabel *lableTime;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@end

@implementation HPBigPhotoHeaderView


- (void)setNoteItem:(NoteListViewItem *)noteItem
{
    _noteItem = noteItem ;
    
    _labelName.text = noteItem.ownerNickName ;
    NSDate *articleCreateDate = [XTTickConvert getNSDateWithTick:noteItem.articleCreateTime] ;
    _lableTime.text = [XTTickConvert timeInfoWithDate:articleCreateDate] ;
    
    [_headImageView xt_setImageWithPic:noteItem.ownerHeadPic
                      placeHolderImage:IMG_HEAD_NO] ;
    
    if ([UserOnDevice hasLogin]) {
        _btFoucus.selected = noteItem.isFollow ;
        _btFoucus.hidden = [UserOnDevice checkUserIsOwnerWithUserID:noteItem.ownerId] ;
    }
    else {
        _btFoucus.selected = false ;
    }
    
}

- (IBAction)headOnClick:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(userheadOnClickWithUserID:userName:)]) {
        [self.delegate userheadOnClickWithUserID:_noteItem.ownerId userName:_noteItem.ownerNickName] ;
    }
}

- (IBAction)btFoucusOnClick:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(followUserBtOnClickWithCreaterID:followed:)]) {
        BOOL haslogin = [self.delegate followUserBtOnClickWithCreaterID:_noteItem.ownerId followed:!sender.selected] ;
        if (!haslogin) return ;
        sender.selected = !sender.selected ;                        
    }
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor whiteColor] ;
    
    [_btFoucus setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btFoucus.layer.cornerRadius = 5. ;
    _btFoucus.layer.borderWidth = 1. ;
    _btFoucus.layer.borderColor = [UIColor xt_w_dark].CGColor ;
    _btFoucus.tintColor = [UIColor xt_w_dark] ;
    
    _headImageView.layer.cornerRadius = _headImageView.frame.size.width / 2. ;
    _headImageView.layer.masksToBounds = YES ;

    _lableTime.textColor =  [UIColor xt_w_light] ;
    _labelName.textColor = [UIColor xt_w_dark] ;

}



@end
