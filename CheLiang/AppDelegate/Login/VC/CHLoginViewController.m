//
//  CHLoginViewController.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/5/12.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHLoginViewController.h"

@interface CHLoginViewController ()

@end

@implementation CHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    
    UIButton *btn =[UIButton new];
    btn.frame = CGRectMake(10, 100, 50, 50);
    [btn addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor greenColor];
     [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}

- (void)handleAction:(id)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
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
