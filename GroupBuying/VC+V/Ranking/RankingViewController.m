//
//  RankingViewController.m
//  GroupBuying
//
//  Created by TuTu on 16/8/22.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "RankingViewController.h"

@interface RankingViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation RankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"排行榜" ;
    
    
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
