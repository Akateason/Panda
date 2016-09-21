//
//  MineController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MineController.h"
#import "UserOnDevice.h"


@interface MineController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (nonatomic,strong) UIImageView *imgView ;

@end

@implementation MineController

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    UIImage *image = [UIImage imageNamed:@"test_m"] ;
    float imgWid = image.size.width ;
    float imgHeight = image.size.height ;
    CGRect rect = CGRectZero ;
    rect.size = CGSizeMake(APP_WIDTH, APP_WIDTH * imgHeight / imgWid) ;
    _imgView = [[UIImageView alloc] initWithFrame:rect] ;
    _imgView.image = image ;
    [_scrollview addSubview:_imgView] ;
    _scrollview.contentSize = _imgView.frame.size ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO] ;
    [self.navigationController setNavigationBarHidden:NO] ;
    
    
    
    [UserOnDevice  clean] ;
}




@end
