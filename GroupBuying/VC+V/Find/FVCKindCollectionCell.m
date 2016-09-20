//
//  FVCKindCollectionCell.m
//  GroupBuying
//
//  Created by teason on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FVCKindCollectionCell.h"

@interface FVCKindCollectionCell () 

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;



@end

@implementation FVCKindCollectionCell

- (void)setStr:(NSString *)str
{
    _str = str ;
    
    _labelTitle.text = str ;
}

- (void)setIndex:(int)index
{
    _index = index ;
    
    _imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"btn_find_%d",index+1]] ;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _labelTitle.textColor = [UIColor xt_w_light] ;
}






@end
