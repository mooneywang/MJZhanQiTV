//
//  ZQPlayerView.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/16.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQPlayerView.h"
#import <AVFoundation/AVFoundation.h>

@interface ZQPlayerView ()

@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playerItem;

@end

@implementation ZQPlayerView

- (instancetype)init {
    if (self = [super init]) {
        [self basicConfig];
    }
    return self;
}

- (void)basicConfig {
    _isPlaying = NO;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];
    self.playerLayer.frame = layer.bounds;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _isPlaying = !_isPlaying;
    NSLog(@"isPlaying:%d",_isPlaying);
}

#pragma mark - getter & setter

- (AVPlayerItem *)playerItem {
    if (!_playerItem) {
        _playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:_urlString]];
    }
    return _playerItem;
}

- (AVPlayer *)player {
    if (!_player) {
        _player = [AVPlayer playerWithPlayerItem:self.playerItem];
    }
    return _player;
}

- (AVPlayerLayer *)playerLayer {
    if (!_playerLayer) {
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        _playerLayer.backgroundColor = [UIColor blackColor].CGColor;
    }
    return _playerLayer;
}

- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
    [self.layer addSublayer:self.playerLayer];
    [self.player play];
}

- (void)dealloc {
    _isPlaying = NO;
}

@end
