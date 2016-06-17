//
//  ZQPlayerControlView.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/17.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQPlayerControlView.h"
#import <Masonry.h>

@interface ZQPlayerControlView ()

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *fullScreenButton;

@end

@implementation ZQPlayerControlView

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
    self.backgroundColor = [UIColor clearColor];
    self.hidden = YES;
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setBackgroundImage:[UIImage imageNamed:@"movie_back"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_backButton];
    
    _fullScreenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_fullScreenButton setBackgroundImage:[UIImage imageNamed:@"movie_fullscreen"] forState:UIControlStateNormal];
    [_fullScreenButton setBackgroundImage:[UIImage imageNamed:@"movie_mini"] forState:UIControlStateSelected];
    [_fullScreenButton addTarget:self action:@selector(fullScreen:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_fullScreenButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@44);
        make.height.equalTo(@44);
        make.top.equalTo(self).offset(5);
        make.left.equalTo(self);
    }];
    
    [_fullScreenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@44);
        make.height.equalTo(@44);
        make.bottom.equalTo(self);
        make.right.equalTo(self);
    }];
}

- (void)back {
    if ([self.delegate respondsToSelector:@selector(playerControlViewDidClickBackButton)]) {
        [self.delegate playerControlViewDidClickBackButton];
    }
}

- (void)fullScreen:(UIButton *)sender {
    sender.selected = !sender.selected;
    if ([self.delegate respondsToSelector:@selector(playerControlViewDidClickFullScreenButton:)]) {
        [self.delegate playerControlViewDidClickFullScreenButton:sender];
    }
}


@end
