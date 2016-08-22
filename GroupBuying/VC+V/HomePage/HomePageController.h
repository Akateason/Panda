//
//  HomePageController.h
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RootCtrl.h"

@interface HomePageController : RootCtrl

// title
@property (nonatomic,strong) NSArray                 *menuItems ;
@property (weak, nonatomic) IBOutlet UIButton        *btTitleLogo;

@end
