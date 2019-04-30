//
//  AppDelegate.h
//  CheLiang
//
//  Created by 李长鸿 on 2019/4/19.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//    @property (nonatomic, strong) SYTabbarViewController *tabbarViewController;
@property (nonatomic, strong) UINavigationController *currentNavigationController;

+ (AppDelegate *)sharedDelegate;

@end

