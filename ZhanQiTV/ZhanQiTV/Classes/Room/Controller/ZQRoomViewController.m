//
//  ZQRoomViewController.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/15.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

/*
    测试直播url：http://wshdl.load.cdn.zhanqi.tv/zqlive/36596_HD3eX.flv?get_url=1
 */

#import "ZQRoomViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ZQPlayerView.h"
#import "ZQConstants.h"

@interface ZQRoomViewController ()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) ZQPlayerView *playerView;

@end

@implementation ZQRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self defaultConfig];
    [self addPlayerView];
}

- (void)defaultConfig {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)addPlayerView {
    _playerView = [[ZQPlayerView alloc] init];
    _playerView.backgroundColor = [UIColor blackColor];
    _playerView.frame = CGRectMake(0, kStatusBarH, kScreenW, kScreenW * 9 / 16.0);
    [self.view addSubview:_playerView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
