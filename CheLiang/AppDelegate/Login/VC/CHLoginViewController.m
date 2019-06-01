//
//  CHLoginViewController.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/5/12.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//  参考宽度 375

#import "CHLoginViewController.h"
#import <UIView+CHFrame.h>
#import "CHLoginManager.h"

@interface CHLoginViewController ()

@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UIImageView *carBgImageView;
@property(nonatomic,strong)UIButton *loginBtn1;
@property(nonatomic,strong)UIButton *loginBtn2;
@property(nonatomic,strong)UIButton *loginBtn3;

@end

@implementation CHLoginViewController
{
    CGFloat ratio;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ratio = [UIScreen mainScreen].bounds.size.width / 375.0;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.iconImageView];
    [self.view addSubview:self.carBgImageView];
    if ([CHLoginManager sharedInstance].isWXAppInstalled) {
        [self.view addSubview:self.loginBtn1];
        [self.view addSubview:self.loginBtn2];
    }
    else{
        [self.view addSubview:self.loginBtn3];
    }
     [self refreshFrame];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    BOOL installedWX = [CHLoginManager sharedInstance].isWXAppInstalled; //没有安装微信
    [self.loginBtn1 setHidden:!installedWX];
    [self.loginBtn2 setHidden:!installedWX];
    [self.loginBtn3 setHidden:installedWX];
    
    CGFloat bottom = KScreenHeight-148;
    __weak typeof(self)wself = self;
    [UIView animateWithDuration:1 animations:^{
        wself.loginBtn1.bottom = bottom;
        wself.loginBtn2.bottom = bottom;
        wself.loginBtn3.bottom = bottom;
    }];
}

- (void)handleAction:(id)sender {
//    if (sender == _loginBtn1) {
//        [[CHLoginManager sharedInstance] appLogin:WeChatLoginType withUserName:nil withPassword:nil];;
//    }
//    else if (sender == _loginBtn2 || sender == _loginBtn3)
//    {
//        [[CHLoginManager sharedInstance] appLogin:QQLoginType withUserName:nil withPassword:nil];;
//    }
//    else
//    {
        [self dismissViewControllerAnimated:NO completion:nil];
//    }
    
    
}

- (void)refreshFrame {
    self.iconImageView.centerX = self.view.centerX;
    self.carBgImageView.bottom = KScreenHeight-47;
    CGFloat bottom = KScreenHeight-148;
    self.loginBtn1.bottom = bottom + 50;
    self.loginBtn2.bottom = bottom + 50;
    self.loginBtn3.bottom = bottom + 50;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, KScreenHeight*109/667.0, 167*ratio,  167*ratio)];
        imageview.image = [UIImage imageNamed:@"logo_white"];
        _iconImageView = imageview;
    }
    return _iconImageView;
}


- (UIImageView *)carBgImageView
{
    if (!_carBgImageView) {
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 353*ratio, 294*ratio)];
        imageview.image = [UIImage imageNamed:@"bg_car"];
        _carBgImageView = imageview;
    }
    return _carBgImageView;
}

- (UIButton *)loginBtn1
{
    if (!_loginBtn1) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(43*ratio, 0, 128*ratio, 43*ratio)];
        [btn setImage:[UIImage imageNamed:@"log_qq"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn1 = btn;
    }
    return _loginBtn1;
}

- (UIButton *)loginBtn2
{
    if (!_loginBtn2) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth-43*ratio-128*ratio, 0, 128*ratio, 43*ratio)];
        [btn setImage:[UIImage imageNamed:@"log_wechat"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn2 = btn;
    }
    return _loginBtn2;
}
- (UIButton *)loginBtn3
{
    if (!_loginBtn3) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(43, 0, KScreenWidth-43*2, 43*ratio)];
        [btn setImage:[UIImage imageNamed:@"log_qq2"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn3 = btn;
    }
    return _loginBtn3;
}

@end
