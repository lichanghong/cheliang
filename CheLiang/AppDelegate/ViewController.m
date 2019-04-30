//
//  ViewController.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/4/19.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "ViewController.h"
#import "CLAppLaunchView.h"

@interface ViewController ()
@property (nonatomic,strong) CLAppLaunchView *launchView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [CLAppLaunchView showOnView:self.view];
    // Do any additional setup after loading the view.
}


@end
