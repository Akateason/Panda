//
//  HotTagCollectionCell.m
//  GroupBuying
//
//  Created by teason on 16/9/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HotTagCollectionCell.h"

@interface HotTagCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@end

@implementation HotTagCollectionCell

- (void)setIndex:(int)index
{
    _index = index ;
    
    _labelTitle.text =  @[@"# 你好,夏天",@"# 不会化妆我教你",@"# 说走就走的旅行"][index] ;
    _imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"t_find_%d",index]] ;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //    _imgView.layer.masksToBounds = YES ;
    _labelTitle.textColor = [UIColor xt_w_comment] ;
}

@end
