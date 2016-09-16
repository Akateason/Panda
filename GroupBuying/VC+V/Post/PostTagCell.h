//
//  PostTagCell.h
//  GroupBuying
//
//  Created by TuTu on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * _Nonnull idPostTagCell = @"PostTagCell" ;


@protocol PostTagCellDelegate <NSObject>

- (void)addTag ;
- (void)saveDraft ;

@end

@interface PostTagCell : UITableViewCell

@property (nonatomic,weak) id <PostTagCellDelegate> delegate ;
@property (nonatomic,strong,nullable) NSArray *listTags ;
@property (nonatomic,copy) void (^closeTagBlock)(NSInteger indexRemove) ;

@end
