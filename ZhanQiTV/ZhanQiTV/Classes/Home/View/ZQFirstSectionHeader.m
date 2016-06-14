//
//  ZQFirstSectionHeader.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/14.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQFirstSectionHeader.h"

@interface ZQFirstSectionHeader ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ZQFirstSectionHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews {
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = [UIColor redColor];
    [self addSubview:_scrollView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _scrollView.frame = self.bounds;
}

- (void)setAdModelList:(NSArray *)adModelList {
    _adModelList = adModelList;
}

@end
