//
//  BigPhotoHeaderViewProtocolHeader.h
//  GroupBuying
//
//  Created by TuTu on 16/10/11.
//  Copyright © 2016年 teason. All rights reserved.
//

#ifndef BigPhotoHeaderViewProtocolHeader_h
#define BigPhotoHeaderViewProtocolHeader_h

@protocol HPBigPhotoHeaderViewDelegate <NSObject>

- (void)userheadOnClickWithUserID:(NSString *)userID userName:(NSString *)name ;
- (BOOL)followUserBtOnClickWithCreaterID:(NSString *)createrID followed:(BOOL)bFollow ;

@end

#endif /* BigPhotoHeaderViewProtocolHeader_h */
