//
//  FVCBannerCell.m
//  GroupBuying
//
//  Created by TuTu on 16/9/20.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FVCBannerCell.h"
#import "XTLoopScrollView.h"

@interface FVCBannerCell () <XTLoopScrollViewDelegate>

@end

@implementation FVCBannerCell

+ (CGFloat)getHeight
{
    return APP_WIDTH * 35. / 75. ;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    CGRect rect = CGRectMake(0, 0, APP_WIDTH, [[self class] getHeight]) ;
    XTLoopScrollView *loopScroll = [[XTLoopScrollView alloc] initWithFrame:rect
                                                              andImageList:@[@"banner1",@"banner2",@"banner3"]
                                                                   canLoop:YES
                                                                  duration:5.0] ;
    loopScroll.delegate = self ;
    loopScroll.color_pageControl        = [UIColor colorWithRed:250.0/255.0 green:219/255.0 blue:249/255.0 alpha:1] ;
    loopScroll.color_currentPageControl = [UIColor redColor] ;
    
    [self addSubview:loopScroll] ;
    
    
}

- (void)tapingCurrentIndex:(NSInteger)currentIndex
{
    NSLog(@"currently tapped picture's index is '%ld' ",(long)currentIndex) ;
}








- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
