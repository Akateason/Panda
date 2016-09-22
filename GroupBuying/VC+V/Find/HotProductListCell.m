//
//  HotProductCell.m
//  GroupBuying
//
//  Created by teason on 16/9/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HotProductListCell.h"

@interface HotProductListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation HotProductListCell

- (void)setIndex:(int)index
{
    _index = index ;
    
    _imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"banner%d",index]] ;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
     
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
