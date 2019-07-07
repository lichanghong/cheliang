//
//  CHBaseNavBar.h
//  CheLiang
//
//  Created by 李长鸿 on 2019/7/5.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHBaseNavBar : UIView

- (void)addDefaultBackBtn;

@property (nonatomic,copy)dispatch_block_t goBackCallBack;

@end

NS_ASSUME_NONNULL_END
