//
//  CHLoginManager.h
//  wxProj_Example
//
//  Created by 李长鸿 on 2019/5/12.
//  Copyright © 2019 1211054926@qq.com. All rights reserved.
//
typedef enum {
    QQLoginType = 1,
    WeChatLoginType,
    SinaLoginType,
    AppLoginType
} LoginType;//登录类型


#import <Foundation/Foundation.h>

#pragma mark - 登录协议
@protocol CHLoginDelegate <NSObject>
@required
/**
 *  登录成功
 *
 *  @param userInfo  用户信息
 *  @param loginType 登录类型
 */
-(void)loginFinished:(NSDictionary*)userInfo withLoginType:(LoginType)loginType;//#登录成功
/**
 *  登录失败
 *
 *  @param errorDic 失败信息,格式:@{@"message":,@"error":,@"loginType":}
 */
-(void)loginFailed:(NSDictionary*)errorDic;//#登录失败
@end

@interface CHLoginManager : NSObject
/**
 *  登录代理
 */
@property(nonatomic,weak)id <CHLoginDelegate>            loginDelegate;
@property(nonatomic,assign)LoginType loginType;

/**
 *  单例
 *
 *  @return 单利对象
 */
+ (instancetype)sharedInstance;

/**
 *  登录,支持三方及新氧
 *
 *  @param loginType 登录类型
 *  @param userName  用户名,新氧登陆必填,三方随意
 *  @param password  密码,新氧登陆必填,三方随意
 */
-(void)appLogin:(LoginType)loginType withUserName:(NSString*)userName withPassword:(NSString*)password;
/**
 *  重写AppDelegate以下函数
 *  - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
 *
 *  - (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;
 *
 */
-(BOOL)handleOpenURL:(NSURL*)url;


@end


