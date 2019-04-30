//
//  CLAppLaunchView.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/4/27.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CLAppLaunchView.h"
#import <UIView+CHFrame.h>
#import <UIImage+GIF.h>
#import <AVFoundation/AVFoundation.h>

@interface CLAppLaunchView ()
@property (nonatomic,strong)UIImageView *imgView;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation CLAppLaunchView

+ (void)showOnView:(UIView *)view
{
    CLAppLaunchView *launchview = [CLAppLaunchView new];
    launchview.backgroundColor = [UIColor blackColor];
    launchview.frame = view.bounds;
    [view addSubview:launchview];
    [launchview loadGif];
}

- (void)loadGif
{
    {
        [self addSubview:self.imgView];
        self.imgView.center = self.center;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"launch_gif" ofType:@"gif"];
        self.imgView.image = [UIImage sd_imageWithGIFData:[NSData dataWithContentsOfFile:path]];
        self.imgView.backgroundColor = [UIColor redColor];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self removeFromSuperview];
        });
    }
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app_launch_sound" ofType:@"mp3"];
        // 2. 创建音乐播放对象
        NSURL *audio = [NSURL URLWithString:path];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audio error:nil];
        // 3.准备播放 (音乐播放的内存空间的开辟等功能)  不写这行代码直接播放也会默认调用prepareToPlay
        [self.audioPlayer prepareToPlay];
        [self.audioPlayer play];

    }
}

- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth*0.75, KScreenWidth*300*0.75/320.0)];
    }
    return _imgView;
}

@end
