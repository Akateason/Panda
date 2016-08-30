//
//  PostTagAddCollectionCell.m
//  GroupBuying
//
//  Created by TuTu on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PostTagAddCollectionCell.h"

@interface PostTagAddCollectionCell ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation PostTagAddCollectionCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    _bgView.backgroundColor = [UIColor xt_seperate] ;
    _label.textColor = [UIColor xt_tabbarRedColor] ;
}

@end
