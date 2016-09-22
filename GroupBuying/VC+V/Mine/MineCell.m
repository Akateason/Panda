//
//  MineCell.m
//  GroupBuying
//
//  Created by teason on 16/9/23.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MineCell.h"

@interface MineCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgDefaultType;
@property (weak, nonatomic) IBOutlet UIView *hasMsgCome;

@end

@implementation MineCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    self.hasNewMessage = false ;
    self.typeOfCell = MineCell_typeDefault ;
    
    _titleLabel.textColor = [UIColor xt_w_dark] ;
    _hasMsgCome.backgroundColor = [UIColor xt_tabbarRedColor] ;
}

- (void)setHasNewMessage:(BOOL)hasNewMessage
{
    _hasNewMessage = hasNewMessage ;
    
    _hasMsgCome.hidden = !hasNewMessage ;
}

- (void)setTypeOfCell:(CellDisplayType)typeOfCell
{
    _typeOfCell = typeOfCell ;
    
    if (typeOfCell == MineCell_typeDefault) {
        _hasMsgCome.hidden = true ;
        _imgDefaultType.hidden = false ;
    }
    else if (typeOfCell == MineCell_typeMessage) {
        _imgDefaultType.hidden = true ;
        _hasMsgCome.hidden = true ;
    }
}

- (void)setupCellWithList:(NSArray *)list
{
    if (!list || !list.count) {
        return ;
    }
    
    NSString *title = [list firstObject] ;
    _titleLabel.text = title ;
    [_imgView setImage:[UIImage imageNamed:[list lastObject]]] ;    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
