//
//  PhotoTaggingStageView.m
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "PhotoTaggingStageView.h"
#import "PhotoTagView.h"

@interface PhotoTaggingStageView ()
{
    NSMutableArray  *m_listTagView ;
}
@property (nonatomic,strong) UIImageView    *imgView ;

@end


@implementation PhotoTaggingStageView


- (void)setOriginImage:(UIImage *)originImage
{
    _originImage = originImage ;
    
    self.imgView.image = originImage ;
}

- (UIImageView *)imgView
{
    if (!_imgView)
    {
        CGRect rect = CGRectZero ;
        rect.size.width = self.frame.size.width ;
        rect.size.height = self.frame.size.width ;
        rect.origin.y = ( self.frame.size.height - self.frame.size.width ) / 2.0 ;
        _imgView = [[UIImageView alloc] initWithFrame:rect] ;
        
        _imgView.contentMode = UIViewContentModeScaleAspectFit ;
        
        if (![_imgView superview])
        {
            [self addSubview:_imgView] ;
        }
    }
    
    return _imgView ;
}

#pragma mark - initial
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        m_listTagView = [@[] mutableCopy] ;
        [self imgView] ;
    }
    
    return self;
}

- (void)addTagWithStr:(NSString *)strDisplay
            ptInStage:(CGPoint)ptInStage
{
    PhotoTagView *tagView = [[PhotoTagView alloc] initWithStrDisplay:strDisplay
                                                           ptInStage:ptInStage
                                                           direction:NO
                                                            backView:self] ;
    [m_listTagView addObject:tagView] ;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject] ;
    CGPoint ptStart = [touch locationInView:self] ;
    [self addTagWithStr:@"呵呵哒" ptInStage:ptStart] ;
}


//
//#pragma mark - public
//- (void)addPasterWithImg:(UIImage *)imgP
//{
//    [self clearAllOnFirst] ;
//    self.pasterCurrent = [[XTPasterView alloc] initWithBgView:self
//                                                     pasterID:self.newPasterID
//                                                          img:imgP] ;
//    _pasterCurrent.delegate = self ;
//    [m_listPaster addObject:_pasterCurrent] ;
//}
//
//- (UIImage *)doneEdit
//{
//    //    NSLog(@"done") ;
//    [self clearAllOnFirst] ;
//    
//    //    NSLog(@"self.originImage.size : %@",NSStringFromCGSize(self.originImage.size)) ;
//    CGFloat org_width = self.originImage.size.width ;
//    CGFloat org_heigh = self.originImage.size.height ;
//    CGFloat rateOfScreen = org_width / org_heigh ;
//    CGFloat inScreenH = self.frame.size.width / rateOfScreen ;
//    
//    CGRect rect = CGRectZero ;
//    rect.size = CGSizeMake(APPFRAME.size.width, inScreenH) ;
//    rect.origin = CGPointMake(0, (self.frame.size.height - inScreenH) / 2) ;
//    
//    UIImage *imgTemp = [UIImage getImageFromView:self] ;
//    //    NSLog(@"imgTemp.size : %@",NSStringFromCGSize(imgTemp.size)) ;
//    
//    UIImage *imgCut = [UIImage squareImageFromImage:imgTemp scaledToSize:rect.size.width] ;
//    
//    return imgCut ;
//}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
