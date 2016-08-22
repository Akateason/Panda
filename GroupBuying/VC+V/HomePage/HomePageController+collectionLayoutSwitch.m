//
//  HomePageController+collectionLayoutSwitch.m
//  GroupBuying
//
//  Created by teason on 16/8/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "HomePageController+collectionLayoutSwitch.h"

@implementation HomePageController (collectionLayoutSwitch)

- (void)setLayout:(UICollectionViewLayout *)layout
   collectionView:(UICollectionView *)collectionView
         switcher:(UIBarButtonItem *)itemSwitcher
{
    UICollectionView * __weak weakCollectionView = collectionView ;
    UIBarButtonItem * __weak weakItemSwitcher = itemSwitcher ;
    
   [collectionView setCollectionViewLayout:layout animated:false completion:^(BOOL finished) {
       if (finished)
       {
           weakItemSwitcher.enabled = true ;
           weakCollectionView.contentOffset = CGPointZero ;
           [weakCollectionView reloadData] ;
       }
   }] ;
}

@end
