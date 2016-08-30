//
//  TagSearchingCell.m
//  GroupBuying
//
//  Created by teason on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "TagSearchingCell.h"


@interface TagSearchingCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelTag;

@end

@implementation TagSearchingCell

- (void)setCellType:(TypeOfTagCell)cellType
{
    _cellType = cellType ;
    
    if (cellType == typeDefaultDisplay) {
        self.backgroundColor = [UIColor whiteColor] ;
    }
    else if (cellType == typeConfirmAddTag) {
        self.backgroundColor = [UIColor xt_seperate] ;
    }
}

- (void)setStrDisplay:(NSString *)strDisplay
{
    _strDisplay = strDisplay ;
    
    if (self.cellType == typeDefaultDisplay) {
        _labelTag.text = strDisplay ;
    }
    else if (self.cellType == typeConfirmAddTag) {
        _labelTag.text = [NSString stringWithFormat:@"点击添加 : %@",strDisplay] ;
    }
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    _labelTag.textColor = [UIColor xt_w_light] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
