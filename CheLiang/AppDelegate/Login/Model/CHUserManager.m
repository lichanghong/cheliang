//
//  CHUserManager.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/6/1.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHUserManager.h"

@implementation CHUserManager

static CHUserManager * instance;
+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (BOOL)hasLoginedIn
{
    return NO;
}

@end
