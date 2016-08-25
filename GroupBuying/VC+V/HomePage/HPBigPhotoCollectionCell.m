//
//  HPBigPhotoCollectionCell.m
//  GroupBuying
//
//  Created by teason on 16/8/19.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HPBigPhotoCollectionCell.h"
#import "TestUser.h"

@interface HPBigPhotoCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgProductView;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UIView *sepline;
@property (weak, nonatomic) IBOutlet UIButton *btCollection;
@property (weak, nonatomic) IBOutlet UIButton *btComment;
@property (weak, nonatomic) IBOutlet UIButton *btLike;

@property (weak, nonatomic) IBOutlet UILabel *labelLikeNum;
@property (weak, nonatomic) IBOutlet UILabel *labelCommentNum;

@end

@implementation HPBigPhotoCollectionCell

#pragma mark -
- (void)setIndex:(int)index
{
    _index = index ;
    
    _imgProductView.image = [UIImage imageNamed:[TestUser bigImage:index]] ;
    _labelTitle.text = @"今天的天气真好" ;
    
}

#pragma mark -
- (void)awakeFromNib
{
    self.backgroundColor = [UIColor whiteColor] ;
    
    _labelTitle.textColor = [UIColor xt_w_dark] ;
    
    _sepline.backgroundColor = [UIColor xt_seperate] ;
    
    _labelLikeNum.textColor = [UIColor xt_w_light] ;
    
    _labelCommentNum.textColor = [UIColor xt_w_light] ;
}

+ (CGSize)getSize
{
    float height = APP_WIDTH * 1000 / 750 + 75. ;
    return CGSizeMake(APP_WIDTH, height) ;
}

- (IBAction)btCollectionOnClick:(UIButton *)sender
{
    sender.selected = !sender.selected ;
}

- (IBAction)btCommentOnClick:(id)sender
{
    
}

- (IBAction)btLikeOnClick:(UIButton *)sender
{
    sender.selected = !sender.selected ;
}

@end


