//
//  HomePageController+collectionLayoutSwitch.h
//  GroupBuying
//
//  Created by teason on 16/8/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HomePageController.h"

@interface HomePageController (collectionLayoutSwitch)

- (void)setLayout:(UICollectionViewLayout *)layout
   collectionView:(UICollectionView *)collectionView
         switcher:(UIButton *)itemSwitcher ;

@end
