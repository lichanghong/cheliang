//
//  CHHomeTableViewCell.h
//  CheLiang
//
//  Created by 李长鸿 on 2019/6/29.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ETTableViewCell/UITableViewCell+ET.h>
#import <MNet/MGetMainPageInfoModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface CHHomeTableViewCell : UITableViewCell
@property (nonatomic,strong)MGetMainPageInfoModel *pageInfoModel;
@end

NS_ASSUME_NONNULL_END
