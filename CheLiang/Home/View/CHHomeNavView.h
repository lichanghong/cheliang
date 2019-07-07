//
//  CHHomeNavView.h
//  CheLiang
//
//  Created by 李长鸿 on 2019/6/23.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CHHomeNavViewActionType) {
    CHHomeNavViewActionType_left,
    CHHomeNavViewActionType_right
};
@protocol CHHomeNavViewDelegate <NSObject>

- (void)CHHomeNavViewActionType:(CHHomeNavViewActionType)type;

@end


@interface CHHomeNavView : UIView

+ (instancetype)createNavView;
@property (nonatomic,weak)id<CHHomeNavViewDelegate>delegate;

@property (nonatomic,strong)UIButton *leftBtn;
@property (nonatomic,strong)UILabel *centerLabel;
@property (nonatomic,strong)UIButton *rightBtn;

@end


