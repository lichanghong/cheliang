//
//  CHMineViewController.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/7/7.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHMineViewController.h"
#import "CHBaseNavBar.h"
#import "CHMineTableViewCell.h"
#import <ETDevice/ETDevice.h>
#import <ETFont/UIFont+ET.h>
#import <ETColor/ETColor.h>
#import <ETSafe/ETSafe.h>
#import "CHMineHeader.h"

@interface CHMineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)CHBaseNavBar *navBar;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,copy)NSArray *pageInfos;

@end

@implementation CHMineViewController

- (void)dealloc
{
    NSLog(@"%@ dealloc.....",NSStringFromClass(self.class));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageInfos = @[@"我的订单",@"地址管理",@"反馈投递",@"公司信息",@"与车两合作"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setHidden:YES];
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.tableView];
    __weak typeof(self)wself = self;
    [CHMineTableViewCell registToTableView:self.tableView];
    
    self.navBar.goBackCallBack = ^{
        [wself.navigationController popViewControllerAnimated:YES];
    };
}

#pragma mark tableview delegate datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pageInfos.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CHMineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CHMineTableViewCell.cellIdentifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.contentLabel.text =  [self.pageInfos safeObjectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 142;
    }
    return 55;
}
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    CHArticleViewController *vc = [[CHArticleViewController alloc]init];
//    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.navBar.bottom, kScreenWidth(), kScreenHeight()-self.navBar.bottom-44) style:UITableViewStylePlain];
        _tableView.dataSource  = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
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




@end
