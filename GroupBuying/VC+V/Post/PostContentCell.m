//
//  PostContentCell.m
//  GroupBuying
//
//  Created by teason on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PostContentCell.h"

@interface PostContentCell ()

@property (weak, nonatomic) IBOutlet UIView *seperateLine;
@property (weak, nonatomic) IBOutlet UITextField *tf_title;
@property (weak, nonatomic) IBOutlet UITextView *tv_words;

@end

@implementation PostContentCell

- (void)awakeFromNib
{
    _seperateLine.backgroundColor = [UIColor xt_seperate] ;
    _tf_title.textColor = [UIColor xt_w_light] ;
    _tv_words.textColor = [UIColor xt_w_light] ;
    _tv_words.backgroundColor = [UIColor whiteColor] ;
}



@end
