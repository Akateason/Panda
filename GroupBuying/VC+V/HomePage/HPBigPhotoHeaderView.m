//
//  HPBigPhotoHeaderView.m
//  GroupBuying
//
//  Created by TuTu on 16/8/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HPBigPhotoHeaderView.h"

@interface HPBigPhotoHeaderView ()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIButton *btFoucus;
@property (weak, nonatomic) IBOutlet UILabel *lableTime;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@end

@implementation HPBigPhotoHeaderView

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

- (IBAction)btFoucusOnClick:(id)sender
{
    
}


@end
