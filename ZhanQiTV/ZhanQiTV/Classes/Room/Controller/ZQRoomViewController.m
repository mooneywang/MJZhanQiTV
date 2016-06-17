//
//  ZQRoomViewController.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/15.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQRoomViewController.h"
#import "ZQPlayerView.h"
#import "ZQConstants.h"
#import "ZQAPI.h"
#import "ZQHomeListModel.h"
#import "ZQAdModel.h"

@interface ZQRoomViewController () <ZQPlayerViewDelegate>

@property (nonatomic, strong) ZQPlayerView *playerView;

@end

@implementation ZQRoomViewController
{
    CATransform3D _originalTransform;
}

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
}

- (ZQPlayerView *)playerView {
    if (!_playerView) {
        _playerView = [[ZQPlayerView alloc] init];
        _playerView.frame = CGRectMake(0, 0, kScreenW, kScreenW * 9 / 16.0);
        _playerView.delegate = self;
        // 保存原始的transform
        _originalTransform = _playerView.layer.transform;
        [self.view addSubview:_playerView];
    }
    return _playerView;
}

#pragma mark - getter & setter

- (void)setList:(List *)list {
    _list = list;
    self.playerView.urlString = [NSString stringWithFormat:@"%@%@%@", kHLSBaseUrl, list.videoId, @".m3u8"];
}

- (void)setRoomModel:(RoomModel *)roomModel {
    _roomModel = roomModel;
    self.playerView.urlString = [NSString stringWithFormat:@"%@%@%@", kHLSBaseUrl, roomModel.videoIdKey, @".m3u8"];
}

#pragma mark - ZQPlayerViewDelegate

- (void)playerViewDidClickBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)playerViewDidClickFullScreenButton:(UIButton *)sender {
    if (sender.selected) { // 全屏
        [UIApplication sharedApplication].statusBarHidden = YES;
        [UIView animateWithDuration:0.3 animations:^{
            _playerView.frame = CGRectMake(0, 0, kScreenH, kScreenW);
            // 绕z轴旋转
            CATransform3D transform = CATransform3DMakeRotation(M_PI / 2, 0, 0, 1.0);
            _playerView.layer.transform = transform;
            _playerView.center = self.view.center;
        } completion:^(BOOL finished) {
            
        }];
    } else { // 小屏
        [UIView animateWithDuration:0.3 animations:^{
            _playerView.layer.transform = _originalTransform;
            _playerView.frame = CGRectMake(0, 0, kScreenW, kScreenW * 9 / 16);
            _playerView.center = CGPointMake(kScreenW * 0.5, _playerView.frame.size.height * 0.5);
        } completion:^(BOOL finished) {
            
        }];
    }
    
}

@end
