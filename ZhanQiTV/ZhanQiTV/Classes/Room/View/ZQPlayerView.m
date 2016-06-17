//
//  ZQPlayerView.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/16.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQPlayerView.h"
#import <AVFoundation/AVFoundation.h>
#import "ZQPlayerControlView.h"

@interface ZQPlayerView () <ZQPlayerControlViewDelegate>

@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playerItem;

/**  播放控制view */
@property (nonatomic, strong) ZQPlayerControlView *controlView;

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
    [UIApplication sharedApplication].statusBarHidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];
    self.playerLayer.frame = layer.bounds;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.controlView.frame = self.bounds;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.controlView.hidden = !self.controlView.hidden;
    [UIApplication sharedApplication].statusBarHidden = self.controlView.hidden;
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

- (ZQPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [[ZQPlayerControlView alloc] init];
        _controlView.delegate = self;
    }
    return _controlView;
}

- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
    
    [self.layer insertSublayer:self.playerLayer below:self.layer];
    [self.player play];
    _isPlaying = YES;
    
    // 添加控制view
    [self addSubview:self.controlView];
}

- (void)dealloc {
    _isPlaying = NO;
}

#pragma mark - ZQPlayerControlViewDelegate

- (void)playerControlViewDidClickBackButton {
    if ([self.delegate respondsToSelector:@selector(playerViewDidClickBackButton)]) {
        [self.delegate playerViewDidClickBackButton];
    }
}

- (void)playerControlViewDidClickFullScreenButton:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(playerViewDidClickFullScreenButton:)]) {
        [self.delegate playerViewDidClickFullScreenButton:sender];
    }
}

@end
