//
//  CHUserManager.h
//  CheLiang
//
//  Created by 李长鸿 on 2019/6/1.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHUserManager : NSObject
+ (instancetype)sharedInstance;
@property (nonatomic, assign) BOOL hasLoginedIn;

@end

NS_ASSUME_NONNULL_END
