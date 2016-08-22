//
//  HPBigPhotoCollectionCell.m
//  GroupBuying
//
//  Created by teason on 16/8/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HPBigPhotoCollectionCell.h"

@interface HPBigPhotoCollectionCell ()
@property (weak, nonatomic) IBOutlet UIView *headBackView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIButton *btFoucus;


@property (weak, nonatomic) IBOutlet UIImageView *imgProductView;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *lableTime;
@property (weak, nonatomic) IBOutlet UIView *sepline;
@property (weak, nonatomic) IBOutlet UIButton *btCollection;
@property (weak, nonatomic) IBOutlet UIButton *btComment;
@property (weak, nonatomic) IBOutlet UIButton *btLike;

@property (weak, nonatomic) IBOutlet UILabel *labelLikeNum;
@property (weak, nonatomic) IBOutlet UILabel *labelCommentNum;

@end

@implementation HPBigPhotoCollectionCell

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor whiteColor] ;
    
    _headBackView.backgroundColor = [UIColor whiteColor] ;
    
    [_btFoucus setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btFoucus.layer.cornerRadius = 5. ;
    _btFoucus.layer.borderWidth = 1. ;
    _btFoucus.layer.borderColor = [UIColor xt_w_dark].CGColor ;
    
    _headImageView.layer.cornerRadius = _headImageView.frame.size.width / 2. ;
    _headImageView.layer.masksToBounds = YES ;
    
    _labelTitle.textColor = [UIColor xt_w_dark] ;
    
    _lableTime.textColor =  [UIColor xt_w_light] ;
    
    _sepline.backgroundColor = [UIColor xt_seperate] ;
    
    _labelLikeNum.textColor = [UIColor xt_w_light] ;
    
    _labelCommentNum.textColor = [UIColor xt_w_light] ;
    
}

+ (CGSize)getSize
{
    float height = 70. + APP_WIDTH * 1000 / 750 + 75. ;
    
    return CGSizeMake(APP_WIDTH, height) ;
}

- (IBAction)btFoucusOnClick:(id)sender {
}
- (IBAction)btCollectionOnClick:(id)sender {
}
- (IBAction)btCommentOnClick:(id)sender {
}
- (IBAction)btLikeOnClick:(id)sender {
}


@end
