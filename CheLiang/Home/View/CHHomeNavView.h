//
//  CHHomeNavView.h
//  CheLiang
//
//  Created by 李长鸿 on 2019/6/23.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CHHomeNavView : UIView

+ (instancetype)createNavView;

@property (nonatomic,strong)UIButton *leftBtn;
@property (nonatomic,strong)UILabel *centerLabel;
@property (nonatomic,strong)UIButton *rightBtn;

@end


