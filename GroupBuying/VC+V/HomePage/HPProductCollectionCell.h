//
//  HPProductCollectionCell.h
//  GroupBuying
//
//  Created by teason on 16/8/18.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *id_HPProductCollectionCell = @"HPProductCollectionCell" ;

@interface HPProductCollectionCell : UICollectionViewCell

@property (nonatomic) int  index ;

+ (CGSize)getSize ;

@end
