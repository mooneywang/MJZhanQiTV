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
#import "ZQPlayerView.h"
#import "ZQConstants.h"
#import "ZQAPI.h"
#import "ZQHomeListModel.h"
#import "ZQAdModel.h"

@interface ZQRoomViewController ()

@property (nonatomic, strong) ZQPlayerView *playerView;

@end

@implementation ZQRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self defaultConfig];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)defaultConfig {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
}

- (ZQPlayerView *)playerView {
    if (!_playerView) {
        _playerView = [[ZQPlayerView alloc] init];
        _playerView.frame = CGRectMake(0, 0, kScreenW, kScreenW * 9 / 16.0);
        [self.view addSubview:_playerView];
    }
    return _playerView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setList:(List *)list {
    _list = list;
    self.playerView.urlString = [NSString stringWithFormat:@"%@%@%@", kHLSBaseUrl, list.videoId, @".m3u8"];
}

- (void)setRoomModel:(RoomModel *)roomModel {
    _roomModel = roomModel;
    self.playerView.urlString = [NSString stringWithFormat:@"%@%@%@", kHLSBaseUrl, roomModel.videoIdKey, @".m3u8"];
}

@end
