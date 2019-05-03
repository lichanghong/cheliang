//
//  ViewController.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/4/19.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "ViewController.h"
#import <LaunchGif/CLAppLaunchView.h>
#import <UIImage+GIF.h>

@interface ViewController ()<CLAppLaunchViewDelegate>

//@property (nonatomic,strong) CLAppLaunchView *launchView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [CLAppLaunchView showOnView:self.view WithDelegate:self];
    NSLog(@"%@",[NSBundle mainBundle].resourcePath);
    // Do any additional setup after loading the view.
}

- (UIImage *)gifImage
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"launch_gif" ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [UIImage sd_imageWithGIFData:data];
}
- (NSString *)mp3Path
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"app_launch_sound" ofType:@"mp3"];
    return path;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
