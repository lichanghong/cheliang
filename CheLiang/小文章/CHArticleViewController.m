//
//  CHArticleViewController.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/7/5.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHArticleViewController.h"
#import "CHArticleNavBar.h"
#import <ETDevice/ETDevice.h>

@interface CHArticleViewController ()
@property (nonatomic,strong)CHArticleNavBar *navBar;

@end

@implementation CHArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.navBar];
    // Do any additional setup after loading the view.
}


- (CHArticleNavBar *)navBar
{
    if (!_navBar) {
        _navBar = [[CHArticleNavBar alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth(), kNavigationBarHeight())];
    }
    return _navBar;
}

@end
