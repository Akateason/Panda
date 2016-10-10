//
//  FeaturesController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FeaturesController.h"
#import "XTStretchSegment.h"
#import "XTMultipleTables.h"    
#import "FeaturesHandler.h"
#import "ShopCartCtrller.h"

#define TopRect             CGRectMake(0, 0, APP_WIDTH, 55.)
#define MainRect            CGRectMake(0, 55., APP_WIDTH, APP_HEIGHT - 44. - 20. - 55. - 49.)

#define kKindlistTEMP       @[@"全部",@"护肤",@"个人护理",@"美食",@"家居",@"个人护理",@"美食",@"家居"]

@interface FeaturesController () <XTStretchSegmentDelegate, XTMultipleTablesDelegate>

@property (nonatomic,strong) XTStretchSegment *xtStretchSegment ;
@property (nonatomic,strong) XTMultipleTables *xtMultipleTables ;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barbt_shopcar;

@end

@implementation FeaturesController

#pragma mark - action
- (IBAction)shopcarOnClick:(id)sender
{
    // 购物车
    ShopCartCtrller *cartVC = (ShopCartCtrller *)[[self class] getCtrllerFromStory:@"Shop" controllerIdentifier:@"ShopCartCtrller"] ;
    [cartVC setHidesBottomBarWhenPushed:YES] ;
    [self.navigationController pushViewController:cartVC animated:YES] ;
}

#pragma mark - prop
- (XTStretchSegment *)xtStretchSegment
{
    if (!_xtStretchSegment)
    {
        _xtStretchSegment = [[XTStretchSegment alloc] initWithFrame:TopRect
                                                           dataList:kKindlistTEMP
                                                       overlayImage:[UIImage imageNamed:@"btBase"]
                                                      hasSpliteLine:false
                                                               type:TypeBaseLine] ;
        _xtStretchSegment.xtDelegate = self ;
        if (![_xtStretchSegment superview]) {
            [self.view addSubview:_xtStretchSegment] ;
        }
    }
    
    return _xtStretchSegment ;
}

#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
    _barbt_shopcar.tintColor = [UIColor xt_tabbarRedColor ] ;
    
    NSMutableArray *tmplist = [@[] mutableCopy] ;
    for (int i = 0; i < kKindlistTEMP.count; i++)
    {
        FeaturesHandler *handler = [[FeaturesHandler alloc] init] ;
        [tmplist addObject:handler] ;
    }
    
    
    self.xtMultipleTables = [[XTMultipleTables alloc] initWithFrame:MainRect
                                                           handlers:tmplist] ;
    self.xtMultipleTables.xtDelegate = self ;
    [self.view addSubview:self.xtMultipleTables] ;
    
    [self xtStretchSegment] ;

}






#pragma mark - XTStretchSegmentDelegate
- (void)xtStretchSegmentMoveToTheIndex:(NSInteger)index
                              dataItem:(id)item
{
    NSLog(@"xtStretchSegmentMoveToTheIndex %@",@(index)) ;
    [self.xtMultipleTables xtMultipleTableMoveToTheIndex:(int)index] ;
}




#pragma mark - XTMultipleTablesDelegate
- (void)moveToIndexCallBack:(int)index
{
    NSLog(@"moveToIndexCallBack %@",@(index)) ;
    self.xtStretchSegment.currentIndex = index ;
    [self.xtMultipleTables pulldownCenterTableIfNeeded] ;
}






@end
