//
//  CHMineTableViewCell.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/7/7.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHMineTableViewCell.h"
#import <ETDevice/ETDevice.h>
#import <ETFont/UIFont+ET.h>
#import <ETColor/ETColor.h>
#import <ETSafe/ETSafe.h>


@implementation CHMineTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
        
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.contentLabel];
}


- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel= [[UILabel alloc] initWithFrame:CGRectMake(15, 0, kScreenWidth()-50, 55)];
        _contentLabel.textColor = colorForHex(@"101010");
        _contentLabel.font = RegularFont(15);
    }
    return _contentLabel;
}

@end
