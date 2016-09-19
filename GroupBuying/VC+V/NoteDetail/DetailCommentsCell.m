//
//  DetailCommentsCell.m
//  GroupBuying
//
//  Created by teason on 16/9/18.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DetailCommentsCell.h"

@interface DetailCommentsCell ()

@property (weak, nonatomic) IBOutlet UIView *seperateline;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIButton *btMore;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIView *baseline;

@end

@implementation DetailCommentsCell

- (IBAction)btMoreOnClick:(id)sender
{
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _seperateline.backgroundColor = [UIColor xt_seperate] ;
    _labelTitle.textColor = [UIColor xt_w_dark] ;
    [_btMore setTitleColor:[UIColor xt_w_light] forState:0] ;
    _baseline.backgroundColor = [UIColor xt_seperate] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
