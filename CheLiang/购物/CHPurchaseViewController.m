//
//  CHPurchaseViewController.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/6/1.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHPurchaseViewController.h"
#import "CHHomeNavView.h"
#import <ETDevice/ETDevice.h>
#import <ETFont/UIFont+ET.h>
#import <ETColor/ETColor.h>
#import <ETSafe/ETSafe.h>
#import <MNet/MNet.h>
#import "CHHomeTableViewCell.h"


@interface CHPurchaseViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)CHHomeNavView *navBar;
@property (nonatomic,strong)UICollectionView *collectionView;

@end

@implementation CHPurchaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setHidden:YES];
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.collectionView];
    self.navBar.centerLabel.text = @"购物";
    [self.collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(UICollectionViewCell.class)];
    // Do any additional setup after loading the view.
}

- (NSInteger ) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger ) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
     return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    ZLPhotoPickerBrowserViewController *browserVc = [[ZLPhotoPickerBrowserViewController alloc] init];
//    browserVc.dataSource = self;
//    browserVc.delegate = self;
//    browserVc.currentIndexPath = [NSIndexPath indexPathForItem:indexPath.item inSection:0];
//    [self presentViewController:browserVc animated:NO completion:nil];
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(16, 14, 16, 14);//分别为上、左、下、右
}


- (CHHomeNavView *)navBar
{
    if (!_navBar) {
        _navBar = [CHHomeNavView createNavView];
    }
    return _navBar;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        CGFloat w = (kScreenWidth()-28)/2.0-8;
        layout.itemSize = CGSizeMake(w, (w/169.0)*206);
        UICollectionView *collectionView = [[UICollectionView alloc]
                                            initWithFrame:CGRectMake(0, self.navBar.bottom,
                                                                     kScreenWidth(),
                                                                     kScreenHeight()-self.navBar.bottom-kTabBarSpacingBottom()-44)
                                                              collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        _collectionView = collectionView;
    }
    return _collectionView;
}



@end
