//
//  SYWeChatManager.h
//  SoyoungLoginAndShare
//
//  Created by zhoujun on 15/4/29.
//  Copyright (c) 2015年 zhoujun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WXApi.h>


@interface CHWeChatManager : NSObject<WXApiDelegate>

- (BOOL)isWxAppInstalled;
+ (instancetype)sharedInstance;

/**
 *  微信登录
 */
-(void)login;

///**
// *  朋友圈
// *
// *  @param shareString 分享文字
// *  @param imageName   分享图片
// */
//-(void)shareToCircleFriendsWithShareText:(NSString*)shareString withShareImage:(UIImage *)image shareUrl:(NSString *)shareUrl;

/**
 *  朋友圈
 *
 *  @param shareString 分享文字
 *  @param imageName   分享图片
 */
-(void)shareToCircleFriendsWithShareText:(NSString*)shareString withShareImgUrl:(NSString *)imgUrl shareUrl:(NSString *)shareUrl;

/**
 *  好友
 *
 *  @param shareString 分享文字
 *  @param imageName   分享图片
 */
-(void)shareToFriendsWithShareText:(NSString *)shareString withShareImage:(UIImage *)image shareUrl:(NSString *)shareUrl content:(NSString *)content;

/**
 *  好友
 *
 *  @param shareString 分享文字
 *  @param imageName   分享图片
 */
-(void)shareToFriendsWithShareText:(NSString *)shareString withShareImgUrl:(NSString *)imageUrl shareUrl:(NSString *)shareUrl content:(NSString *)content;

- (void)shareVideoToFriendsWithShareText:(NSString *)shareString withShareImgUrl:(NSString *)imageUrl shareUrl:(NSString *)shareUrl content:(NSString *)content;

- (void)shareVideoToCircleFriendsWithShareText:(NSString *)shareString withShareImgUrl:(NSString *)imgUrl shareUrl:(NSString *)shareUrl;

 
 
/**
   APP打开小程序

 @param path 小程序跳转路径
 */
- (void)openMiniProgramWithPath:(NSString *)path;

///** 分享好友 视频类型 */
//- (void)shareVideoToCircleFriendsWithShareText:(NSString *)shareString
//                             withShareImage:(UIImage *)image
//                                      shareUrl:(NSString *)shareUrl;
///** 分享朋友圈 视频类型 */
//- (void)shareVideoToFriendsWithShareText:(NSString *)shareString
//                      withShareImage:(UIImage *)image
//                                shareUrl:(NSString *)shareUrl
//                                 content:(NSString *)content;

/** 分享好友 图片类型 */
- (void)shareImageToCircleFriendsWithShareImage:(UIImage *)image;
/** 分享朋友圈 图片类型 */
- (void)shareImageToFriendsWithShareImage:(UIImage *)image;

@end
