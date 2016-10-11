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

//用户修改密码
static NSString *const URL_USERS_PWCHANGE       = @"/gwn/s/user/passwordChg" ;

//用户重置密码
static NSString *const URL_USERS_RESETPW        = @"/gwn/user/passwordReset" ;


//发送手机验证码
static NSString *const URL_VERIFYCODE_CREATE    = @"/gwn/verifycode/create" ;

//检验验证码是否正确
static NSString *const URL_VERIFYCODE_VALID     = @"/gwn/verifycode/valid" ;

//添加关注
static NSString *const URL_FOLLOW_ADD           = @"/gwn/s/follow/add" ;

//取消关注
static NSString *const URL_FOLLOW_CANCEL        = @"/gwn/s/follow/cancel" ;


//上传资源
static NSString *const URL_RESOURCE_UPLOAD      = @"/gwn/s/resource" ;


//添加文章信息
static NSString *const URL_ARTICLE_ADD          = @"/gwn/s/article/add" ;

//搜索首页笔记信息
static NSString *const URL_HOME_LIST_SEARCH     = @"/gwn/note/list/home/search" ;

//指定文章ID搜索笔记详情信息
static NSString *const URL_NOTE_DETAIL          = @"/gwn/note/detail/getById" ;

//添加点赞信息
static NSString *const URL_UPVOTE_ADD           = @"/gwn/s/upvote/add" ;

//删除点赞信息
static NSString *const URL_UPVOTE_REMOVE        = @"/gwn/s/upvote/remove" ;

//添加收藏信息
static NSString *const URL_FAVORITE_ADD         = @"/gwn/s/favorite/add" ;

//删除收藏信息
static NSString *const URL_FAVORITE_REMOVE      = @"/gwn/s/favorite/remove" ;



#endif
