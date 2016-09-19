//
//  UrlRequestHeader.h
//  SuBaoJiang
//
//  Created by apple on 15/6/4.
//  Copyright (c) 2015年 teason. All rights reserved.
//

#ifndef SuBaoJiang_UrlRequestHeader_h
#define SuBaoJiang_UrlRequestHeader_h

//服务器
static NSString *const G_IP_SERVER              = @"http://101.201.71.239:8080/CCommerce" ;

//用户登录
static NSString *const URL_USERS_LOGIN          = @"/gwn/user/login" ;

//用户注册
static NSString *const URL_USERS_REGISTER       = @"/gwn/user/reg" ;

//上传资源
static NSString *const URL_RESOURCE_UPLOAD      = @"/gwn/s/resource" ;


//添加文章信息
static NSString *const URL_ARTICLE_ADD          = @"/gwn/s/article/add" ;

//搜索首页笔记信息
static NSString *const URL_HOME_LIST_SEARCH     = @"/gwn/note/list/home/search" ;

//指定文章ID搜索笔记详情信息
static NSString *const URL_NOTE_DETAIL          = @"/gwn/note/detail/getById" ;




#endif
