//
//  TestUser.m
//  GroupBuying
//
//  Created by TuTu on 16/8/25.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "TestUser.h"

@implementation TestUser

+ (NSArray *)getPlist
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"testUser" ofType:@"plist"] ;
    NSMutableArray *list = [[NSMutableArray alloc] initWithContentsOfFile:plistPath] ;
    return list ;
}


+ (NSString *)username:(NSInteger)index
{
    return [[self class] getPlist][index] ;
}

+ (NSString *)bigImage:(NSInteger)index
{
    return [NSString stringWithFormat:@"%ld",index+1] ;
}

+ (NSString *)headImage:(NSInteger)index
{
    return [NSString stringWithFormat:@"t_h_%ld",index+1] ;
}


@end
