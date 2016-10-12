//
//  RankingViewController.m
//  GroupBuying
//
//  Created by TuTu on 16/8/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RankingViewController.h"
#import "XTSegment.h"
#import "RankingTodayHotCtrl.h"
#import "RankingOverallCtrl.h"


static const float kHeightSegment = 45. ;



@interface RankingViewController () <XTSegmentDelegate>
@property (nonatomic,strong)            RankingTodayHotCtrl *todayVC ; // 今日最热
@property (nonatomic,strong)            RankingOverallCtrl  *overallVC ; //总排行
// UIs
@property (weak, nonatomic) IBOutlet    UIButton           *bt2top ;
@property (nonatomic,strong)            XTSegment          *segment ;

@end

@implementation RankingViewController


#pragma mark - prop
- (XTSegment *)segment
{
    if (!_segment) {
        _segment = [[XTSegment alloc] initWithDataList:@[@"今日热门",@"总排行榜"]
                                                 imgBg:[UIImage imageNamed:@"btBase"]
                                                height:kHeightSegment
                                           normalColor:[UIColor xt_w_light]
                                           selectColor:[UIColor xt_tabbarRedColor]
                                                  font:[UIFont systemFontOfSize:14.]
                                                 frame:APPFRAME] ;
        _segment.backgroundColor = [UIColor whiteColor] ;
        _segment.delegate = self ;
        _segment.frame = CGRectMake(0, 0, APP_WIDTH, kHeightSegment) ;
        if (!_segment.superview) {
            [self.view addSubview:_segment] ;
        }
    }
    return _segment ;
}

- (RankingTodayHotCtrl *)todayVC
{
    if (!_todayVC) {
        _todayVC = [[RankingTodayHotCtrl alloc] initWithNibName:@"RankingTodayHotCtrl" bundle:nil] ;
    }
    return _todayVC ;
}

- (RankingOverallCtrl *)overallVC
{
    if (!_overallVC) {
        _overallVC = [[RankingOverallCtrl alloc] initWithNibName:@"RankingOverallCtrl" bundle:nil] ;
    }
    return _overallVC ;
}


#pragma mark - action top BT
- (IBAction)back2topOnClick:(id)sender
{
    NSLog(@"回到最顶") ;
}

#pragma mark - XTSegmentDelegate 
- (void)clickSegmentWith:(int)index
{
    NSLog(@"index : %d",index) ;
    if (index == 0) {
        self.todayVC.view.frame = [[self class] contentRect] ;
        self.overallVC.view.frame = [[self class] hideRect] ;
    }
    else {
        self.todayVC.view.frame = [[self class] hideRect] ;
        self.overallVC.view.frame = [[self class] contentRect] ;
    }
}




#pragma mark - LIFE
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"排行榜" ;
    [self segment] ;
    
    self.todayVC.view.frame = [[self class] contentRect] ;
    self.overallVC.view.frame = [[self class] hideRect] ;
    [self.view addSubview:self.overallVC.view] ;
    [self.view addSubview:self.todayVC.view] ;
    [self.view bringSubviewToFront:self.bt2top] ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO] ;
    [self.navigationController setNavigationBarHidden:NO] ;
}




#pragma mark - util
+ (CGRect)contentRect
{
    return CGRectMake(0,
                      kHeightSegment,
                      APP_WIDTH,
                      APP_HEIGHT - kHeightSegment) ; /// - APP_STATUSBAR_HEIGHT - APP_NAVIGATIONBAR_HEIGHT
}

+ (CGRect)hideRect
{
    return CGRectMake(APP_WIDTH,
                      kHeightSegment,
                      APP_WIDTH,
                      APP_HEIGHT - kHeightSegment) ; /// - APP_STATUSBAR_HEIGHT - APP_NAVIGATIONBAR_HEIGHT
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
