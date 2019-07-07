//
//  CHHomeNavView.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/6/23.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHHomeNavView.h"
#import <ETDevice/ETDevice.h>
#import <ETFont/UIFont+ET.h>
#import <ETColor/ETColor.h>

@implementation CHHomeNavView

+ (instancetype)createNavView
{
    CHHomeNavView*navView = [[CHHomeNavView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth(),kNavigationBarHeight())];
    navView.backgroundColor = [UIColor whiteColor];
    return navView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.leftBtn];
    [self addSubview:self.rightBtn];
    [self addSubview:self.centerLabel];
}

- (void)handleAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(CHHomeNavViewActionType:)]) {
        if (sender == self.leftBtn) {
            [self.delegate CHHomeNavViewActionType:CHHomeNavViewActionType_left];
        }
        else if (sender == self.rightBtn) {
            [self.delegate CHHomeNavViewActionType:CHHomeNavViewActionType_right];
        }
    }
}

- (UIButton *)leftBtn
{
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 56, 22, 22)];
        [_leftBtn setImage:[UIImage imageNamed:@"nav_news"] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth()-54, 56, 22, 22)];
        [_rightBtn setImage:[UIImage imageNamed:@"nav_set"] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

- (UILabel *)centerLabel
{
    if (!_centerLabel) {
        _centerLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 54, kScreenWidth()-200, 26)];
        _centerLabel.font = [UIFont SemiboldFont:18];
        _centerLabel.textColor = colorForHex(@"101010");
        _centerLabel.text = @"车两";
        _centerLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _centerLabel;
}


@end
