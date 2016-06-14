//
//  ZQPictureView.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/14.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQPictureView.h"
#import "ZQAdModel.h"
#import <UIImageView+WebCache.h>

@implementation ZQPictureView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setAdModel:(AdModel *)adModel {
    _adModel = adModel;
    [self sd_setImageWithURL:[NSURL URLWithString:adModel.spic]];
}

@end
