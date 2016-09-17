//
//  HPBigPhotoHeaderView.m
//  GroupBuying
//
//  Created by TuTu on 16/8/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HPBigPhotoHeaderView.h"
//#import "TestUser.h"
#import "NoteListViewItem.h"
#import "UIImageView+WebCache.h"
#import "XTTickConvert.h"
#import "Pic.h"

@interface HPBigPhotoHeaderView ()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIButton *btFoucus;
@property (weak, nonatomic) IBOutlet UILabel *lableTime;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@end

@implementation HPBigPhotoHeaderView

//- (void)setIndex:(int)index
//{
//    _index = index ;
//    
//    _headImageView.image = [UIImage imageNamed:[TestUser headImage:index]] ;
//    _labelName.text = [TestUser username:index] ;
//    _lableTime.text = @"今天 13 : 32" ;
//}

- (void)setNoteItem:(NoteListViewItem *)noteItem
{
    _noteItem = noteItem ;
    
    _labelName.text = noteItem.ownerNickName ;
    NSDate *articleCreateDate = [XTTickConvert getNSDateWithTick:noteItem.articleCreateTime] ;
    _lableTime.text = [XTTickConvert timeInfoWithDate:articleCreateDate] ;
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:noteItem.ownerHeadPic.qiniuUrl]
     placeholderImage:[UIImage imageNamed:@"t_h_5"]] ;
}

- (IBAction)headOnClick:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(userheadOnClick)]) {
        [self.delegate userheadOnClick] ;
    }
}

- (IBAction)btFoucusOnClick:(id)sender
{
    
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
    
    _headImageView.layer.cornerRadius = _headImageView.frame.size.width / 2. ;
    _headImageView.layer.masksToBounds = YES ;

    _lableTime.textColor =  [UIColor xt_w_light] ;
}



@end
