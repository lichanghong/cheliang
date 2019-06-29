//
//  CHHomeTableViewCell.m
//  CheLiang
//
//  Created by 李长鸿 on 2019/6/29.
//  Copyright © 2019 com.cheliang.app. All rights reserved.
//

#import "CHHomeTableViewCell.h"
#import <ETSDWebImage/UIImageView+WebCache.h>
#import <ETDevice/ETDevice.h>
#import <ETFont/UIFont+ET.h>
#import <ETColor/ETColor.h>
#import <ETString/NSString+CHUtil.h>

@interface CHHomeTableViewCell ()
@property (nonatomic,strong)UIImageView *headImageV;
@property (nonatomic,strong)UILabel *nickNameLabel;
@property (nonatomic,strong)UILabel *publishDateLabel;
@property (nonatomic,strong)UIImageView *productImageV;
@property (nonatomic,strong)UILabel *productDescLabel;


@end

@implementation CHHomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
        
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.headImageV];
    [self addSubview:self.nickNameLabel];
    [self addSubview:self.publishDateLabel];
    [self addSubview:self.productImageV];
    [self addSubview:self.productDescLabel];
}

- (void)setPageInfoModel:(MGetMainPageInfoModel *)pageInfoModel
{
    _pageInfoModel = pageInfoModel;
    [self.headImageV sd_setImageWithURL:[NSURL URLWithString:pageInfoModel.publishUserPicture]];
    self.nickNameLabel.text = pageInfoModel.publishUserName;
    self.publishDateLabel.text = pageInfoModel.publishTime;
    [self.productImageV sd_setImageWithURL:[NSURL URLWithString:pageInfoModel.publishPicture]];
    CGSize descSize = [pageInfoModel.publishContent sizeWithFont:self.productDescLabel.font constrainedToSize:CGSizeMake(self.productDescLabel.width,60)];
    pageInfoModel.cellHeight = 87+kScreenWidth()+descSize.height+19+25;
    self.productDescLabel.text = pageInfoModel.publishContent;
    self.productDescLabel.height = descSize.height;
}

- (UIImageView *)productImageV
{
    if (!_productImageV) {
        _productImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.headImageV.bottom+15, kScreenWidth(), kScreenWidth())];
        _productImageV.backgroundColor = [UIColor redColor];
    }
    return _productImageV;
}

- (UILabel *)productDescLabel{
    if (!_productDescLabel) {
        _productDescLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, self.productImageV.bottom+14, kScreenWidth()-28, 0)];
        _productDescLabel.backgroundColor = [UIColor redColor];
        _productDescLabel.font = RegularFont(14);
        _productDescLabel.textColor = colorForHex(@"101010");
    }
    return _productDescLabel;
}

- (UILabel *)publishDateLabel
{
    if (!_publishDateLabel) {
        _publishDateLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.nickNameLabel.x, self.nickNameLabel.bottom+3, self.nickNameLabel.width,  self.nickNameLabel.height)];
        _publishDateLabel.font = RegularFont(13);
        _publishDateLabel.textColor = colorForHex(@"bbbbbb");
    }
    return _publishDateLabel;
}
- (UILabel *)nickNameLabel
{
    if (!_nickNameLabel) {
        _nickNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.headImageV.right+14, 26, kScreenWidth()-self.headImageV.right-28, 20)];
//        _nickNameLabel.backgroundColor = [UIColor redColor];
        _nickNameLabel.font = RegularFont(14);
        _nickNameLabel.textColor = colorForHex(@"101010");
    }
    return _nickNameLabel;
}
- (UIImageView *)headImageV
{
    if (!_headImageV) {
        _headImageV = [[UIImageView alloc]initWithFrame:CGRectMake(14, 18, 54, 54)];
        _headImageV.layer.cornerRadius = 27;
        [_headImageV.layer setMasksToBounds:YES];
        _headImageV.backgroundColor = [UIColor redColor];
    }
    return _headImageV;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
