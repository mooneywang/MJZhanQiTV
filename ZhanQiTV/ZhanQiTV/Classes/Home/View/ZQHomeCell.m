//
//  ZQHomeCell.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/15.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQHomeCell.h"
#import "ZQHomeListModel.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "ZQConstants.h"

@interface ZQHomeCell ()

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UIImageView *genderIconView;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UILabel *followsLabel;

@end

@implementation ZQHomeCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.backgroundColor = [UIColor whiteColor];
    
    _coverImageView = [[UIImageView alloc] init];
    [self addSubview:_coverImageView];
    
    _genderIconView = [[UIImageView alloc] init];
    [self addSubview:_genderIconView];
    
    _nickNameLabel = [[UILabel alloc] init];
    _nickNameLabel.textAlignment = NSTextAlignmentLeft;
    _nickNameLabel.font = [UIFont systemFontOfSize:12];
    _nickNameLabel.textColor = ZQRGBColor(191, 191, 191, 1);
    [self addSubview:_nickNameLabel];
    
    _followsLabel = [[UILabel alloc] init];
    _followsLabel.textAlignment = NSTextAlignmentLeft;
    _followsLabel.font = [UIFont systemFontOfSize:12];
    _followsLabel.textColor = ZQRGBColor(191, 191, 191, 1);
    [self addSubview:_followsLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.and.right.equalTo(self);
        make.bottom.equalTo(self).offset(-20);
    }];
    
    [_genderIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_coverImageView.mas_left);
        make.top.equalTo(_coverImageView.mas_bottom);
        make.bottom.equalTo(self);
        make.width.equalTo(@20);
    }];
    
    [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_coverImageView.mas_bottom);
        make.bottom.equalTo(self);
        make.left.equalTo(_genderIconView.mas_right).offset(5);
    }];
    
    [_followsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_coverImageView.mas_bottom);
        make.bottom.equalTo(self);
        make.right.equalTo(_coverImageView.mas_right);
    }];
}

- (void)setList:(List *)list {
    _list = list;
    [_coverImageView sd_setImageWithURL:[NSURL URLWithString:list.spic]];
    // 1:女 2:男
    if ([list.gender isEqualToString:@"1"]) {
        _genderIconView.image = [UIImage imageNamed:@"icon_room_female"];
    }else {
        _genderIconView.image = [UIImage imageNamed:@"icon_room_male"];
    }
    // 设置nickName
    _nickNameLabel.text = list.nickname;
    // 设置follows
    int follows = [list.follows intValue];
    if (follows >= 10000) {
        _followsLabel.text = [NSString stringWithFormat:@"%.1f万", follows / 10000.0];
    } else {
        _followsLabel.text = list.follows;
    }
}

@end
