//
//  PostTagItemCollectionCell.h
//  GroupBuying
//
//  Created by TuTu on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *idPostTagItemCollectionCell = @"PostTagItemCollectionCell" ;

@interface PostTagItemCollectionCell : UICollectionViewCell

+ (CGSize)getSizeWithTagName:(NSString *)tagName ;

@end