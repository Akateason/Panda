//
//  PhotoTaggingStageView.h
//  GroupBuying
//
//  Created by TuTu on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoTaggingStageView : UIView

@property (nonatomic,strong,readwrite) UIImage *originImage ;

- (instancetype)initWithFrame:(CGRect)frame ;

- (void)addTagWithStr:(NSString *)strDisplay
            ptInStage:(CGPoint)ptInStage ;



@end
