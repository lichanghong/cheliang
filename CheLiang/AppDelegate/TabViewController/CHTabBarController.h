//
//  CHTabBarController.h
//  CheLiang
//
//  Created by 李长鸿 on 2019/4/20.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TabbarControllerType) {
    TabbarControllerType0  = 0,
    TabbarControllerType1  = 1,
    TabbarControllerType2  = 2
};



@class CHTabBarController;

@protocol TabBarControllerDelegate <NSObject>
@optional
- (BOOL)tabBarController:(CHTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController;
- (void)tabBarController:(CHTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;

@end

@interface CHTabBarController : UITabBarController
@property (nonatomic, weak) id<TabBarControllerDelegate> delegate;




@end


