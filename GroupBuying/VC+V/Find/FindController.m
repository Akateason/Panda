//
//  FindController.m
//  GroupBuying
//
//  Created by teason on 16/8/15.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "FindController.h"
#import "PhotoEditorCtrller.h"

@interface FindController ()

@end

@implementation FindController

- (IBAction)btAction:(id)sender
{
    NSMutableArray *tmpList = [@[] mutableCopy] ;
    for (int i = 1; i < 10; i++)
    {
        [tmpList addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%@",@(i)]]] ;
    }
    
    PhotoEditorCtrller *photoEditorCtrl = (PhotoEditorCtrller *)[[self class] getCtrllerFromStory:@"Camera" controllerIdentifier:@"PhotoEditorCtrller"] ;
    photoEditorCtrl.listPhotos = tmpList ;
    [photoEditorCtrl setHidesBottomBarWhenPushed:YES] ;
    [self.navigationController pushViewController:photoEditorCtrl animated:YES] ;
}




@end
