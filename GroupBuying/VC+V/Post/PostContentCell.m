//
//  PostContentCell.m
//  GroupBuying
//
//  Created by teason on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PostContentCell.h"

@interface PostContentCell () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *seperateLine;
@property (weak, nonatomic) IBOutlet UITextField *tf_title;
@property (weak, nonatomic) IBOutlet UITextView *tv_words;
@property (weak, nonatomic) IBOutlet UILabel *lb_tfPlaceholder;

@end

@implementation PostContentCell

- (void)awakeFromNib
{
    _seperateLine.backgroundColor = [UIColor xt_seperate] ;
    _tf_title.textColor = [UIColor xt_w_light] ;
    _tv_words.textColor = [UIColor xt_w_light] ;
    _tv_words.backgroundColor = [UIColor whiteColor] ;
    [_tf_title setValue:[UIColor xt_w_light] forKeyPath:@"_placeholderLabel.textColor"];
    _lb_tfPlaceholder.textColor = [UIColor xt_w_light] ;
    _tv_words.delegate = self ;
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    self.lb_tfPlaceholder.hidden = (textView.text.length > 0) ;
}


- (NSString *)fetchTitleStr
{
    return self.tf_title.text ;
}

- (NSString *)fetchContentStr
{
    return self.tv_words.text ;
}


@end
