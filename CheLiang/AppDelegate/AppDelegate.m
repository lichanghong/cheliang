//
//  AppDelegate.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/4/19.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <CHNavigationController/CHNavigationController.h>
#import <CHTabBarController/CHTabBarController.h>
#import "CHLaunchViewController.h"
#import "CHLoginManager.h"
#import "CHLoginViewController.h"
#import "CHUserManager.h"
#import "CHHomeViewController.h"
#import "CHPurchaseViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)sharedDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
//    CHLaunchViewController *launchVC = [[CHLaunchViewController alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:launchVC];
//    nav.navigationBar.hidden = YES;
    __weak typeof(self) weakSelf = self;

//    launchVC.dismiss = ^{
        [weakSelf launchVCDismiss];
//    };
//    self.window.rootViewController = nav;
//    [self.window makeKeyAndVisible];

    NSLog(@"nav");
    return YES;
}

- (void)launchVCDismiss {
    CHTabBarController *tabbarC = [CHTabBarController new];
    [tabbarC tabBarControllerCls:@[CHHomeViewController.class,
                                   CHBaseViewController.class,
                                   CHPurchaseViewController.class] NavCls:UINavigationController.class];
    UINavigationController *rootNav = [[UINavigationController alloc]initWithRootViewController:tabbarC];
    rootNav.navigationBar.hidden = YES;
    self.window.rootViewController = rootNav;
    [self.window makeKeyAndVisible];
//    
//    if ([[CHUserManager sharedInstance] hasLoginedIn]) { //！logined
//        CHLoginViewController *vc  = [[CHLoginViewController alloc]init];
//        [rootNav pushViewController:vc animated:NO];
//    }
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [[CHLoginManager sharedInstance] handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[CHLoginManager sharedInstance] handleOpenURL:url];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
