//
//  EditorPhotosCollectionCell.m
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "EditorPhotosCollectionCell.h"
#import "YXLTagEditorImageView.h"
#import "Article.h"
//#import "ArticlePicItem.h"
#import "ArticlePicItemInfo.h"


@interface EditorPhotosCollectionCell ()

@property (weak, nonatomic) IBOutlet UIView *imgContainer;
@property (nonatomic,strong)YXLTagEditorImageView *tagEditorImageView;

@end

@implementation EditorPhotosCollectionCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _imgContainer.backgroundColor = [UIColor clearColor] ;
    [self.imgContainer addSubview:self.tagEditorImageView] ;
    [self.tagEditorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.imgContainer) ;
    }];
}


- (void)setImage:(UIImage *)image
{
    _image = image ;
    
    if (!image) {
        return ;
    }
    
    self.tagEditorImageView.imagePreviews.image = image ;
}

//- (void)setItems:(NSArray *)items
//{
//    _items = items ;
//    
//    if (!items || [items isKindOfClass:[NSNull class]]) {
//        return ;
//    }
//
//    self.tagEditorImageView = nil ;
//
//    for (int i = 0; i < items.count; i++)
//    {
//        ArticlePicItemInfo *itemInfo = items[i] ;
//        [self.tagEditorImageView addTagViewText:itemInfo.text
//                                       Location:CGPointMake(itemInfo.posX, itemInfo.posY)
//                          isPositiveAndNegative:[itemInfo positiveOrNagitive]
//                                           type:itemInfo.type] ;
//    }
//}

- (YXLTagEditorImageView *)tagEditorImageView
{
    if (!_tagEditorImageView)
    {
        _tagEditorImageView = [[YXLTagEditorImageView alloc] initWithImage:nil
                                                                     frame:CGRectMake(0, 0, APP_WIDTH - 20., APP_HEIGHT - 105 - 44 - 20)] ;
        _tagEditorImageView.userInteractionEnabled = NO ;
    }
    return _tagEditorImageView ;
}


@end
