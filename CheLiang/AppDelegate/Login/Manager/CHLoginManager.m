//
//  CHLoginManager.m
//  wxProj_Example
//
//  Created by 李长鸿 on 2019/5/12.
//  Copyright © 2019 1211054926@qq.com. All rights reserved.
//

#import "CHLoginManager.h"
#import "CHWeChatManager.h"
@interface CHLoginManager ()

@end

@implementation CHLoginManager

static CHLoginManager *sharedInstance = nil;
+ (instancetype)sharedInstance
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
        [[CHWeChatManager sharedInstance] registerApp];
    });
    return sharedInstance;
}

//登录
- (void)appLogin:(LoginType)loginType withUserName:(NSString *)userName withPassword:(NSString *)password
{
    switch (loginType) {
            case WeChatLoginType:{
                [[CHWeChatManager sharedInstance] login];
            }
            break;
        case QQLoginType:{
            [[CHWeChatManager sharedInstance] login];
        }
            break;
        default:
            break;
    }
}

-(BOOL)handleOpenURL:(NSURL*)url {
    return [WXApi handleOpenURL:url delegate:[CHWeChatManager sharedInstance]];
}

- (BOOL)isWXAppInstalled
{
    return true;[WXApi isWXAppInstalled];
}

@end
