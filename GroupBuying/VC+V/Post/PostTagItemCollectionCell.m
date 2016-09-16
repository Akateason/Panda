//
//  PostTagItemCollectionCell.m
//  GroupBuying
//
//  Created by TuTu on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PostTagItemCollectionCell.h"

@interface PostTagItemCollectionCell ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *labelTagName;
@property (weak, nonatomic) IBOutlet UIButton *btClose;

@end

@implementation PostTagItemCollectionCell

- (IBAction)btCloseOnClick:(id)sender
{
    NSLog(@"关闭标签") ;
    self.closeTagBlock(self.index) ;
}

- (void)setTagName:(NSString *)tagName
{
    _tagName = tagName ;
    
    _labelTagName.text = tagName ;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _bgView.backgroundColor = [UIColor xt_seperate] ;
    _labelTagName.textColor = [UIColor xt_tabbarRedColor] ;
}

+ (CGSize)getSizeWithTagName:(NSString *)tagName
{
    CGSize overSize = CGSizeMake(300., 15.) ;
    UIFont *font = [UIFont systemFontOfSize:12.0f] ;
    CGSize labelsize = [tagName boundingRectWithSize:overSize
                                             options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                          attributes:@{NSFontAttributeName : font}
                                             context:nil].size ;
    
    return  CGSizeMake(9. + labelsize.width + 30. - 7., 30.) ;
}

@end
