//
//  EditorPhotosCollectionCell.m
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "EditorPhotosCollectionCell.h"
#import "PhotoTaggingStageView.h"

@interface EditorPhotosCollectionCell ()

@property (nonatomic,strong) PhotoTaggingStageView *stageView ;


@end

@implementation EditorPhotosCollectionCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    [self stageView] ;
}


- (PhotoTaggingStageView *)stageView
{
    if (!_stageView) {
        CGRect rect = CGRectZero ;
        rect.size = CGSizeMake(APP_WIDTH, APP_WIDTH) ;
        _stageView = [[PhotoTaggingStageView alloc] initWithFrame:rect] ;
        _stageView.backgroundColor = [UIColor whiteColor] ;
        if (!_stageView.superview) {
            [self addSubview:_stageView] ;
        }
    }
    return _stageView ;
}

- (void)setImage:(UIImage *)image
{
    _image = image ;
    
    self.stageView.originImage = image ;
}

@end
