





#import "DigitInformation.h"
#import "Reachability.h"
#import "YXSpritesLoadingView.h"
#import "NSObject+MKBlockTimer.h"
#import "ServerRequest.h"
#import "XTFileManager.h"
#import "CommonFunc.h"
//#import "WXApi.h"

static dispatch_once_t onceToken ;
static DigitInformation *instance ;

@implementation DigitInformation

+ (DigitInformation *)shareInstance
{
    dispatch_once(&onceToken, ^{
        instance = [[DigitInformation alloc] init] ;
    }) ;
    return instance ;
}


#pragma mark --





#define KEY_UUID            @"uuid"

- (NSString *)uuid
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    _uuid = [userDefaults objectForKey:KEY_UUID] ;
    if (!_uuid)
    {
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        //    NSString *uuid = (NSString *)CFUUIDCreateString(kCFAllocatorDefault,uuidRef) ;
        _uuid = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault,uuidRef)) ;
        CFRelease(uuidRef) ;
        [userDefaults setObject:_uuid forKey:KEY_UUID];
    }
    
    return _uuid ;
}


- (BOOL)appHasInstalledWX
{
    if (_appHasInstalledWX == TRUE) return _appHasInstalledWX ;
    
//    _appHasInstalledWX = [WXApi isWXAppInstalled] ;
    return _appHasInstalledWX ;
}

@end


