//
//  PostContentCell.h
//  GroupBuying
//
//  Created by teason on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>


static NSString *idPostContentCell = @"PostContentCell" ;

@interface PostContentCell : UITableViewCell

- (NSString *)fetchTitleStr ;
- (NSString *)fetchContentStr ;

@end
