//
//  DetailCoverTitleCell.m
//  GroupBuying
//
//  Created by teason on 16/9/10.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DetailCoverTitleCell.h"
#import "NoteDetailViewItem.h"
#import "Article.h"
#import "Pic.h"

@interface DetailCoverTitleCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptLabel;
@property (weak, nonatomic) IBOutlet UIView *sepline;

@end


@implementation DetailCoverTitleCell

+ (CGFloat)getHeightWithNoteItem:(NoteDetailViewItem *)noteItem
{
    float imgH = APP_WIDTH * 500. / 374. ;
    
    UIFont *fontTitle = [UIFont systemFontOfSize:14] ;
    CGSize sizeTitle = CGSizeMake(APP_WIDTH - 2 * 12., 100.) ;
    CGSize titlelabelSize = [noteItem.articleInfo.title boundingRectWithSize:sizeTitle
                                              options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                           attributes:@{NSFontAttributeName:fontTitle}
                                              context:nil].size ;
    CGFloat titleHeight = titlelabelSize.height ;

    UIFont *fontContent= [UIFont systemFontOfSize:13] ;
    CGSize sizeContent = CGSizeMake(APP_WIDTH - 2 * 12., 1000.) ;
    CGSize contentLabelSize = [noteItem.articleInfo.content boundingRectWithSize:sizeContent
                                                                     options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                                  attributes:@{NSFontAttributeName:fontContent}
                                                                     context:nil].size ;
    CGFloat contentHeight = contentLabelSize.height ;
    
    
    return 8. + imgH + 10. + titleHeight + 14 + contentHeight + 10 + 15 ;
}

- (void)setNoteItem:(NoteDetailViewItem *)noteItem
{
    _noteItem = noteItem ;
    
    _titleLabel.text = noteItem.articleInfo.title ;
    _descriptLabel.text = noteItem.articleInfo.content ;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _titleLabel.textColor = [UIColor xt_w_dark] ;
    _descriptLabel.textColor = [UIColor xt_w_content] ;
    _sepline.backgroundColor = [UIColor xt_seperate] ;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
