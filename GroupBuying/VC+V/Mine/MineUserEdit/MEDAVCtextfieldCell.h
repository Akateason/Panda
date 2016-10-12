//
//  MEDAVCtextfieldCell.h
//  GroupBuying
//
//  Created by TuTu on 16/10/11.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kID_MEDAVCtextfieldCell = @"MEDAVCtextfieldCell" ;

@interface MEDAVCtextfieldCell : UITableViewCell

@property (nonatomic,copy) NSString *placeholder ;
@property (weak, nonatomic) IBOutlet UITextField *textfield;

@end
