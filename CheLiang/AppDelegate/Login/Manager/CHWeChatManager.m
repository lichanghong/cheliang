//
//  SYWeChatManager.m
//  SoyoungLoginAndShare
//
//  Created by zhoujun on 15/4/29.
//  Copyright (c) 2015年 zhoujun. All rights reserved.
//

#import "CHWeChatManager.h"
#import <AFNetworking/AFNetworking.h>

NSString * const WXAppId = @"wx354ff2b9df7cf4ac";
NSString * const WXAppSecret = @"24999d4a75a3566b6161928821c55b27";

@implementation CHWeChatManager


- (void)registerApp
{
    //微信初始化
    [WXApi registerApp:WXAppId];

}

#pragma mark - public
static CHWeChatManager *sharedInstance = nil;
+ (instancetype)sharedInstance{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
        
    });
    return sharedInstance;
}
- (NSString *)wxAppNotInstalledToast {
    return @"您没有安装微信客户端，请安装后再试";
}
- (void)showWxAppNotInstalledAlerViewIfNeeded {
    if (self.isWxAppInstalled) {
        return;
    }
}

- (BOOL)isWxAppInstalled {
    return [WXApi isWXAppInstalled] && [WXApi isWXAppSupportApi];
}
-(void)login{
    if(![WXApi isWXAppInstalled]){
       
    }else{
        //构造SendAuthReq结构体
        SendAuthReq* req =[[SendAuthReq alloc ] init ];
        req.scope = @"snsapi_userinfo";
        req.state = @"123" ;
        //第三方向微信终端发送一个SendAuthReq消息结构
        [WXApi sendReq:req];
    }
}
 
#pragma mark - WXApiDelegate
-(void)onReq:(BaseReq*)req
{
    NSLog(@"");
}
// 微信支付处理 && 朋友圈分享处理
- (void)onResp:(BaseResp *)resp
{
    if ([resp isKindOfClass:[SendAuthResp class]]) {   // 登录
        SendAuthResp *response = (SendAuthResp *)resp;
        switch (response.errCode) {
                case WXSuccess:
            {
                NSString *code = [NSString stringWithFormat:@"%@",response.code];
                [self requestForUserInfoWithCode:code];
            }
                break;
                case WXErrCodeAuthDeny:
                break;
                case WXErrCodeUserCancel:
                break;
            default:
                break;
        }
    }
}

-(void)requestForUserInfoWithCode:(NSString *)code
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/plain", nil];
    NSString *url = @"http://39.106.228.230/car-api/api/login";
    [manager POST:url parameters:@{@"loginType":@"0",@"code":code} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
    
}



@end
