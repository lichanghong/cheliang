//
//  CHLaunchViewController.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/5/11.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHLaunchViewController.h"
#import <LaunchGif/CLAppLaunchView.h>
#import <UIImage+GIF.h>

@interface CHLaunchViewController ()<CLAppLaunchViewDelegate>

@end

@implementation CHLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    [CLAppLaunchView showOnView:self.view WithDelegate:self dismiss:^{
        if (weakSelf.dismiss) {
            weakSelf.dismiss();
        }
    }];
 
    // Do any additional setup after loading the view.
}

- (UIImage *)imageWithGIFData:(NSData *)data
{
    return [UIImage sd_imageWithGIFData:data];
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
