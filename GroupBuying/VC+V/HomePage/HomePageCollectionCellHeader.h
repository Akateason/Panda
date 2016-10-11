//
//  HomePageCollectionCellHeader.h
//  GroupBuying
//
//  Created by teason on 16/10/11.
//  Copyright © 2016年 teason. All rights reserved.
//

#ifndef HomePageCollectionCellHeader_h
#define HomePageCollectionCellHeader_h

@protocol HomePageCollectionCellDelegate <NSObject>

@optional
- (BOOL)likeNoteID:(NSString *)noteID addOrRemove:(bool)addOrRemove ;
- (BOOL)collectNoteID:(NSString *)noteID addOrRemove:(bool)addOrRemove ;

@end


#endif /* HomePageCollectionCellHeader_h */
