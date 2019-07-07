//
//  CHIphoneLoginVC.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/7/5.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHIphoneLoginVC.h"
#import "CHBaseNavBar.h"
#import <ETDevice.h>
#import <ETColor.h>
#import <UIView+ETGesture.h>
#import <ETFont/UIFont+ET.h>
#import <MNet.h>

@interface CHIphoneLoginVC () <UITextFieldDelegate>
@property (nonatomic,strong)CHBaseNavBar *navBar;
@property (nonatomic,strong)UIScrollView *bgScrollView;
@property (nonatomic,strong)UIImageView *imgV;
@property (nonatomic,strong)UIView *phoneV;
@property (nonatomic,strong)UIView *captchaV;
@property (nonatomic,strong)UIButton *loginBtn;
@property (nonatomic,strong)UIButton *captchaBtn;
@property (nonatomic,strong)UITextField *phoneField;
@property (nonatomic,strong)UITextField *captchaField;

@end

@implementation CHIphoneLoginVC

- (void)dealloc
{
    NSLog(@"%@ dealloc.....",NSStringFromClass(self.class));
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bgScrollView];
    [self.bgScrollView addSubview:self.imgV];
    [self.bgScrollView addSubview:self.phoneV];
    [self.phoneV addSubview:self.phoneField];
    [self.bgScrollView addSubview:self.captchaBtn];
    [self.bgScrollView addSubview:self.captchaV];
    [self.captchaV addSubview:self.captchaField];
    [self.bgScrollView addSubview:self.loginBtn];
    [self.view addSubview:self.navBar];

    __weak typeof(self)wself = self;
    self.navBar.goBackCallBack = ^{
        [wself.navigationController popViewControllerAnimated:YES];
    };
    
    [self.view singleTapped:^(UIGestureRecognizer *gestureRecognizer) {
        [wself.captchaField resignFirstResponder];
        [wself.phoneField resignFirstResponder];
        [wself.bgScrollView setContentOffset:CGPointZero animated:YES];
    }];

}

- (void)handleAction:(id)sender {
    if (sender == self.loginBtn) {
        __weak typeof(self)wself = self;
        [MLoginModel loginWithMobile:@"17737062865" Passwork:@"123456" success:^{
            [wself.navigationController popToRootViewControllerAnimated:YES];
        } failure:^(NSString *errDesc) {
            
        }];
    }
    else if (sender == self.captchaBtn) {
        [self startTime:self.captchaBtn];
    }
}

// _CountdownTime 倒计时总时间；
//_timer 定时器
- (void)startTime:(UIButton *)VerificationCodeButton
{
    __block NSInteger timeout = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (timeout <=0) {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [VerificationCodeButton setTitle:@"重新获取" forState:UIControlStateNormal];
                VerificationCodeButton.userInteractionEnabled = YES;
                VerificationCodeButton.alpha = 1.0;
                VerificationCodeButton.backgroundColor = colorForHex(@"fbc647");
            });
        }
        else
        {
         NSString *strTime = [NSString stringWithFormat:@"%lds", (long)timeout];
            dispatch_async(dispatch_get_main_queue(), ^{
                [VerificationCodeButton setTitle:strTime forState:UIControlStateNormal];
                VerificationCodeButton.userInteractionEnabled = NO;
                VerificationCodeButton.backgroundColor = [UIColor lightTextColor];
            });
            timeout -- ;
        }
    });
    dispatch_resume(timer);
 }

- (void)textAction:(UITextField *)sender {
//    if (sender == self.phoneField) {
//        if (self.phoneField.text.length) {
//
//        }
//    }
//    else if (sender == self.captchaField) {
//
//    }
}
#pragma mark UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField;
{
    if (textField == self.phoneField) {
        [self.bgScrollView setContentOffset:CGPointMake(0, 100) animated:YES];
    }
    else   if (textField == self.captchaField) {
        [self.bgScrollView setContentOffset:CGPointMake(0, 200) animated:YES];
    }
}



#pragma mark get set
- (UITextField *)phoneField
{
    if (!_phoneField) {
        _phoneField =  [[UITextField alloc] initWithFrame:CGRectMake(50, 0, self.phoneV.width-60, self.phoneV.height)];
        _phoneField.placeholder =@"请输入您的手机号";
        _phoneField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneField.layer.cornerRadius = 4;
        _phoneField.layer.masksToBounds = YES;
        _phoneField.delegate = self;
        [_phoneField addTarget:self action:@selector(textAction:) forControlEvents:UIControlEventEditingChanged];
        
        _phoneField.font = RegularFont(14);
        _phoneField.tintColor = [UIColor lightGrayColor];
        _phoneField.textColor = colorForHex(@"333333");
        _phoneField.backgroundColor = [UIColor clearColor];
        _phoneField.keyboardType = UIKeyboardTypePhonePad;
    }
    return _phoneField;
}

- (UITextField *)captchaField
{
    if (!_captchaField) {
        _captchaField =  [[UITextField alloc] initWithFrame:CGRectMake(15, 0, self.captchaV.width-20, self.captchaV.height)];
        _captchaField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _captchaField.layer.cornerRadius = 4;
        _captchaField.layer.masksToBounds = YES;
        _captchaField.delegate = self;
        [_captchaField addTarget:self action:@selector(textAction:) forControlEvents:UIControlEventEditingChanged];
        
        _captchaField.font = RegularFont(14);
        _captchaField.tintColor = [UIColor lightGrayColor];
        _captchaField.textColor = colorForHex(@"333333");
        _captchaField.backgroundColor = [UIColor clearColor];
        _captchaField.keyboardType = UIKeyboardTypePhonePad;
    }
    return _captchaField;
}
                                      
- (UIButton *)captchaBtn
{
    if (!_captchaBtn) {
        _captchaBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth()-62-99,self.phoneV.bottom+21,99, 44)];
//        _captchaBtn.layer.borderColor = colorForHex(@"bbbbbb").CGColor;
//        _captchaBtn.layer.borderWidth = 1;
        _captchaBtn.layer.cornerRadius = 22;
        _captchaBtn.backgroundColor = colorForHex(@"fbc647");
        _captchaBtn.titleLabel.font = RegularFont(13);
        [_captchaBtn setTitleColor:colorForHex(@"040404") forState:UIControlStateNormal];
        [_captchaBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_captchaBtn addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _captchaBtn;
}
- (UIView *)captchaV
{
    if (!_captchaV) {
        _captchaV = [[UIView alloc]initWithFrame:CGRectMake(61,self.captchaBtn.y, self.captchaBtn.x-15-61, 44)];
        _captchaV.layer.borderColor = colorForHex(@"bbbbbb").CGColor;
        _captchaV.layer.borderWidth = 1;
        _captchaV.layer.cornerRadius = 22;
    }
    return _captchaV;
}


- (CHBaseNavBar *)navBar
{
    if (!_navBar) {
        _navBar = [[CHBaseNavBar alloc]init];
        _navBar.frame = CGRectMake(0, 0, kScreenWidth(), kNavigationBarHeight());
        [_navBar addDefaultBackBtn];
    }
    return _navBar;
}

- (UIImageView *)imgV
{
    if (!_imgV) {
        _imgV = [[UIImageView alloc]initWithFrame:CGRectMake(61, 194+kStatueBarHeight(), 103, 38 )];
        _imgV.backgroundColor = [UIColor redColor];
    }
    return _imgV;
}

- (UIView *)phoneV
{
    if (!_phoneV) {
        _phoneV = [[UIView alloc]initWithFrame:CGRectMake(61, 328+kStatueBarHeight(), kScreenWidth()-61*2, 44)];
        _phoneV.layer.borderColor = colorForHex(@"bbbbbb").CGColor;
        _phoneV.layer.borderWidth = 1;
        _phoneV.layer.cornerRadius = 22;
        UILabel *v = [[UILabel alloc]initWithFrame:CGRectMake(16, 0, 26, 20)];
        v.y = 12;
        v.text = @"+86";
        v.font = RegularFont(14);
        v.textColor = colorForHex(@"101010");
        [_phoneV addSubview:v];
    }
    return _phoneV;
}


- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(61,self.captchaV.bottom+21, self.phoneV.width, 44)];
        _loginBtn.layer.borderColor = colorForHex(@"bbbbbb").CGColor;
        _loginBtn.layer.borderWidth = 1;
        _loginBtn.layer.cornerRadius = 22;
        _loginBtn.titleLabel.font = RegularFont(13);
        [_loginBtn setTitleColor:colorForHex(@"040404") forState:UIControlStateNormal];
        [_loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _loginBtn;
}

- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    }
    return _bgScrollView;
}

@end
