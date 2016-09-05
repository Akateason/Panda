//
//  PostPhotosCell.h
//  GroupBuying
//
//  Created by TuTu on 16/8/30.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *idPostPhotosCell = @"PostPhotosCell" ;

@protocol PostPhotosCellDelegate <NSObject>

- (void)addPhoto ;
- (void)deletePhotoWithList:(NSArray *)list ;

@end

@interface PostPhotosCell : UITableViewCell

@property (nonatomic,weak)  id <PostPhotosCellDelegate> delegate ;
@property (nonatomic,strong) NSArray *listPhotos ;

@end
