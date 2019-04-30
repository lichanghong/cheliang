//
//  CHTabBarController.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/4/20.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHTabBarController.h"

@interface CHTabBarController ()

@property (nonatomic, assign) TabbarControllerType curType;

@property (nonatomic, strong) UIViewController *vc0;
@property (nonatomic, strong) UIViewController *vc1;
@property (nonatomic, strong) UIViewController *vc2;

@end

@implementation CHTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addChildViewControllers];
//        [self setChildControllersCustomTabItem];
//        
//        self.curType = SYTabbarViewControllerTypeHomePage;
//        self.realType = self.curType;
//        self.delegate = self;
//        
//        [self setTabbarNormalTitleColor:[UIColor sy_gray10Color] selectedTitleColor:[UIColor sy_green6Color]];
    }
    return self;
}


- (void)addChildViewControllers
{
//    _vc0 = [[UIViewController alloc] init];
//    [self addChildVc:_indexVC];
////    AppDelegate.currentNavigationController = _indexVC.navigationController;
//
//    _discoveryVC = [[SYDiscoveryViewController alloc] init];
//    _discoveryVC.actionValue = @"circle";
//    [self addChildVc:_discoveryVC];
//
//    UIViewController *emptyVC = [[UIViewController alloc] init];
//    [self addChildVc:emptyVC];
//
//    _yueHuiVC = [[SYYueHuiViewController alloc] init];
//    [self addChildVc:_yueHuiVC];
//
//    _mySelfView = [[SYMediationMyViewController alloc] init];
//    _mySelfView.actionValue = @"My";
//    [self addChildVc:_mySelfView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
