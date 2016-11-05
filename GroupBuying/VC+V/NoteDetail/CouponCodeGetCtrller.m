//
//  CouponCodeGetCtrller.m
//  GroupBuying
//
//  Created by teason on 16/11/5.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "CouponCodeGetCtrller.h"

@interface CouponCodeGetCtrller ()
@property (weak, nonatomic) IBOutlet UIView *couponView;
@property (weak, nonatomic) IBOutlet UIButton *btCancel;
@property (weak, nonatomic) IBOutlet UIButton *btGet;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbIntroduction;
@property (weak, nonatomic) IBOutlet UILabel *lbCoupon;
@property (weak, nonatomic) IBOutlet UIImageView *imgUserHead;
@property (weak, nonatomic) IBOutlet UIView *sepline;
@end

@implementation CouponCodeGetCtrller

#pragma - public
- (void)showCouponCodeView:(UIWindow *)window
{
    [window addSubview:self.view] ;
}

- (void)dismiss
{
    [self.view removeFromSuperview] ;
}


#pragma - life
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lbCoupon.text = @"推荐码 : AAAAAAA" ;
    
    
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5] ;
    _couponView.backgroundColor = [UIColor whiteColor] ;
    _couponView.layer.cornerRadius = 5. ;
    _couponView.layer.masksToBounds = true ;
    _imgUserHead.layer.cornerRadius = CGWidth(_imgUserHead.frame) / 2. ;
    _imgUserHead.layer.masksToBounds = true ;
    _lbName.textColor = [UIColor xt_tabbarRedColor] ;
    _lbIntroduction.textColor = [UIColor xt_w_desc] ;
    _lbCoupon.textColor = [UIColor xt_w_dark] ;
    _btCancel.backgroundColor = [UIColor whiteColor] ;
    [_btCancel setTitleColor:[UIColor xt_w_dark] forState:0] ;
    _btGet.backgroundColor = [UIColor xt_tabbarRedColor] ;
    _sepline.backgroundColor = [UIColor xt_seperate] ;
}

#pragma - bt action
- (IBAction)btCancelOnClick:(id)sender
{
    NSLog(@"bt cancel") ;
    [self dismiss] ;
}

- (IBAction)btGetOnClick:(id)sender
{
    NSLog(@"get coupon code") ;
    [self dismiss] ;
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
