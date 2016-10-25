//
//  NoteDetailViewItem.m
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "NoteDetailViewItem.h"
#import "Comment.h"

@implementation NoteDetailViewItem

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{
             @"commentList" : [Comment class],
             };
}

@end
