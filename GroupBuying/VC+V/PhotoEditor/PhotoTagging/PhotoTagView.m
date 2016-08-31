//
//  PhotoTagView.m
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//


#define SECURITY_LENGTH     75.0


#import "PhotoTagView.h"

static float kTagFontSize       = 10. ;
static float kTagHeight         = 19. ;
static float kRedPointLength    = 8. ;


@interface PhotoTagView ()
{
    CGPoint prevPoint ;
    CGPoint touchStart ;
    CGRect  bgRect ;
}
@property (nonatomic,strong) UIView *redPointView ;

@end

@implementation PhotoTagView

- (instancetype)initWithStrDisplay:(NSString *)strDisplay
                         ptInStage:(CGPoint)ptInStage
                         direction:(BOOL)bDirection
                          backView:(UIView *)backView
{
    self = [super init];
    if (self)
    {
        self.strDisplay = strDisplay ;
        self.ptInStage = ptInStage ;
        self.boolDirection = bDirection ;
        
        
        [self redPointView] ;
        [self setup] ;
        
        [backView addSubview:self] ;
    }
    return self;
}

- (UIView *)redPointView
{
    if (!_redPointView) {
        CGRect redPointRect = CGRectZero ;
        redPointRect.origin = self.ptInStage ;
        redPointRect.size = CGSizeMake(kRedPointLength, kRedPointLength) ;
        _redPointView = [[UIView alloc] initWithFrame:redPointRect] ;
        _redPointView.backgroundColor = [UIColor xt_tabbarRedColor] ;
        _redPointView.layer.cornerRadius = kRedPointLength / 2. ;
        _redPointView.layer.borderColor = [UIColor whiteColor].CGColor ;
        _redPointView.layer.borderWidth = 2. ;
        if (!_redPointView.superview) {
            [self addSubview:_redPointView] ;
        }
    }
    return _redPointView ;
}

- (void)setup
{
    
    CGRect rect = CGRectZero ;
    rect.size = CGSizeMake(100, kTagHeight) ;
    self.frame = rect ;
    self.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) ;
    self.backgroundColor = nil ;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)] ;
    [self addGestureRecognizer:tapGesture] ;
    
    self.userInteractionEnabled = YES ;
}

- (void)tap:(UITapGestureRecognizer *)tapGesture
{
    NSLog(@"tap paster become first respond") ;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject] ;
    touchStart = [touch locationInView:self.superview] ;
}

- (void)translateUsingTouchLocation:(CGPoint)touchPoint
{
    CGPoint newCenter = CGPointMake(self.center.x + touchPoint.x - touchStart.x,
                                    self.center.y + touchPoint.y - touchStart.y) ;
    
    // Ensure the translation won't cause the view to move offscreen. BEGIN
    CGFloat midPointX = CGRectGetMidX(self.bounds) ;
    if (newCenter.x > self.superview.bounds.size.width - midPointX + SECURITY_LENGTH)
    {
        newCenter.x = self.superview.bounds.size.width - midPointX + SECURITY_LENGTH;
    }
    if (newCenter.x < midPointX - SECURITY_LENGTH)
    {
        newCenter.x = midPointX - SECURITY_LENGTH;
    }
    
    CGFloat midPointY = CGRectGetMidY(self.bounds);
    if (newCenter.y > self.superview.bounds.size.height - midPointY + SECURITY_LENGTH)
    {
        newCenter.y = self.superview.bounds.size.height - midPointY + SECURITY_LENGTH;
    }
    if (newCenter.y < midPointY - SECURITY_LENGTH)
    {
        newCenter.y = midPointY - SECURITY_LENGTH;
    }
    
    // Ensure the translation won't cause the view to move offscreen. END
    self.center = newCenter;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//    CGPoint touchLocation = [[touches anyObject] locationInView:self] ;
    
    CGPoint touch = [[touches anyObject] locationInView:self.superview];
    
    [self translateUsingTouchLocation:touch] ;
    
    touchStart = touch;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
