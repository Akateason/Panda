//
//  Resource.h
//  GroupBuying
//
//  Created by TuTu on 16/9/13.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resource : NSObject

@property (nonatomic,copy)  NSString    *idResource ;
@property (nonatomic,copy)  NSString    *name ; // 资源名称
@property (nonatomic,copy)  NSString    *path ; // 资源物理路径
@property (nonatomic,copy)  NSString    *url ;  // 资源url
@property (nonatomic,copy)  NSString    *size ; // 资源文件大小（byte）
@property (nonatomic,copy)  NSString    *category ; //资源种类（头像，文档，证书，普通）允许值: "HEAD", "DOCUMNETS", "CERTIFICATE", "NORMAL"
@property (nonatomic,copy)  NSString    *type ; //资源类型（图像，文档，压缩文件，普通）允许值: "IMAGE", "DOCUMNETS", "COMPRESS", "NORMAL"
@property (nonatomic,copy)  NSString    *extension ; // 文件扩展名
@property (nonatomic)       long long   createTime ;
@property (nonatomic)       long long   updateTime ;
@property (nonatomic,copy)  NSString    *createrId ; // 创建者ID
@property (nonatomic,copy)  NSString    *updaterId ; // 更新者ID
@property (nonatomic)       double      longitude ;
@property (nonatomic)       double      latitude ;
@property (nonatomic)       double      posX ; //位置坐标X
@property (nonatomic)       double      posY ; //位置坐标Y
@property (nonatomic,copy)  NSString    *qiniuUrl ; // 七牛URL

@end
