//
//  ZQSectionHeader.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/13.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQSectionHeader.h"
#import "ZQConstants.h"
#import <Masonry.h>

@interface ZQSectionHeader ()

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZQSectionHeader

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
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = ZQRGBColor(88, 159, 245, 1);
    _lineView.layer.cornerRadius = 2.5;
    _lineView.layer.masksToBounds = YES;
    [self addSubview:_lineView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont boldSystemFontOfSize:17];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.text = @"英雄联盟";
    [self addSubview:_titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _lineView.frame = CGRectMake(10, 5, 5, self.frame.size.height - 10);
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineView.mas_right).offset(10);
        make.center.equalTo(self);
    }];
}



@end
