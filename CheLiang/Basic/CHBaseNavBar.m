//
//  CHBaseNavBar.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/7/5.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHBaseNavBar.h"
#import <ETDevice/ETDevice.h>

@interface CHBaseNavBar()
@property (nonatomic,strong)UIButton *backBtn;

@end

@implementation CHBaseNavBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)addDefaultBackBtn
{
    [self addSubview:self.backBtn];
}

- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(6, 1+kStatueBarHeight(), 50, 50)];
        [_backBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (void)goBack:(id)sender {
    if (self.goBackCallBack) {
        self.goBackCallBack();
    }
}


@end
