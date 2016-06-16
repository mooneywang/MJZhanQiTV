//
//  ZQPlayerView.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/16.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQPlayerView.h"

@implementation ZQPlayerView

- (AVPlayer *)player {
    return [(AVPlayerLayer *)[self layer] player];
}

@end
