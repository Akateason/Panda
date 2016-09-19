//
//  DetailCoverTitleCell.h
//  GroupBuying
//
//  Created by teason on 16/9/10.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_DetailCoverTitleCell = @"DetailCoverTitleCell" ;

@class NoteDetailViewItem ;

@interface DetailCoverTitleCell : UITableViewCell

@property (nonatomic,strong)NoteDetailViewItem *noteItem ;

+ (CGFloat)getHeightWithNoteItem:(NoteDetailViewItem *)noteItem ;

@end
