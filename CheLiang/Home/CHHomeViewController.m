//
//  CHHomeViewController.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/6/1.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHHomeViewController.h"
#import "CHHomeNavView.h"
#import <ETDevice/ETDevice.h>
#import <ETFont/UIFont+ET.h>
#import <ETColor/ETColor.h>
#import <ETSafe/ETSafe.h>
#import <MNet/MNet.h>
#import "CHHomeTableViewCell.h"
#import "CHArticleViewController.h"
#import "CHMineViewController.h"


@interface CHHomeViewController ()
<UITableViewDelegate,UITableViewDataSource,CHHomeNavViewDelegate>
@property (nonatomic,strong)CHHomeNavView *navBar;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,copy)NSArray <MGetMainPageInfoModel*> *pageInfos;

@end

@implementation CHHomeViewController
//NSDictionary *params = @{@"mobile":@"17737062865",@"password":@"123456"};

- (void)dealloc
{
    NSLog(@"%@ dealloc.....",NSStringFromClass(self.class));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self.navigationController.navigationBar setHidden:YES];
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.tableView];

    [CHHomeTableViewCell registToTableView:self.tableView];
    [self loadData];
}

- (void)loadData {
    __weak typeof(self)wself = self;
    [MGetMainPageInfoModel getMainPageInfoWithPageID:@"0" success:^(NSArray * _Nonnull infoModels) {
        wself.pageInfos = infoModels;
        [wself.tableView reloadData];
    } failure:^(NSString * _Nonnull errDesc) {
        
    }];
}

#pragma mark CHHomeNavViewDelegate
- (void)CHHomeNavViewActionType:(CHHomeNavViewActionType)type
{
    if (type == CHHomeNavViewActionType_right) {
        CHMineViewController *minevc = [CHMineViewController new];
        UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
        [nav pushViewController:minevc animated:YES];
    }
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
    CHHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CHHomeTableViewCell.cellIdentifier forIndexPath:indexPath];
    cell.pageInfoModel =  [self.pageInfos safeObjectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MGetMainPageInfoModel *pageInfoModel =  [self.pageInfos safeObjectAtIndex:indexPath.row];
    return pageInfoModel.cellHeight ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CHArticleViewController *vc = [[CHArticleViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.navBar.bottom, kScreenWidth(), kScreenHeight()-self.navBar.bottom-kTabBarSpacingBottom()-44) style:UITableViewStylePlain];
        _tableView.dataSource  = self;
        _tableView.delegate = self;
        [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}


- (CHHomeNavView *)navBar
{
    if (!_navBar) {
        _navBar = [CHHomeNavView createNavView];
        _navBar.frame = CGRectMake(0, 0, kScreenWidth(), kNavigationBarHeight());
        _navBar.delegate = self;
    }
    return _navBar;
}




@end
