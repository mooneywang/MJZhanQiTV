//
//  ZQLiveViewController.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/17.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQLiveViewController.h"
#import "ZQConstants.h"
#import "ZQHomeCell.h"
#import <MJRefresh.h>
#import "ZQRoomViewController.h"
#import "ZQCellConstant.h"
#import "ZQNetworkManager.h"
#import "ZQHomeListModel.h"
#import "ZQAPI.h"

@interface ZQLiveViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) LiveModel *liveModel;

@end

@implementation ZQLiveViewController

static NSString *const liveCellId = @"liveCellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
}

- (void)setupCollectionView {
    kDeviceFactor = kScreenH >= 568 ? 1.0 : kScreenH / 568.0;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((kScreenW - 3 * kMinimumInteritemSpacing) * 0.5, kCellBaseH * kDeviceFactor);
    flowLayout.minimumLineSpacing = kMinimumLineSpacing;
    flowLayout.minimumInteritemSpacing = kMinimumInteritemSpacing;
    flowLayout.sectionInset = UIEdgeInsetsMake(kMinimumLineSpacing, kMinimumLineSpacing, kMinimumLineSpacing, kMinimumLineSpacing);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kMarginTopH, kScreenW, kScreenH - kMarginTopH - kTabBarH) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = kGlobalBackgroundColor;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    // 注册cell
    [_collectionView registerClass:[ZQHomeCell class] forCellWithReuseIdentifier:liveCellId];

    // 集成下拉刷新
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getLists];
    }];
    // 开始刷新
    [_collectionView.mj_header beginRefreshing];
}

- (void)getLists {
    ZQNetworkManager *manager = [ZQNetworkManager sharedManager];
    [manager get:kLiveUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = responseObject[@"data"];
        _liveModel = [[LiveModel alloc] initWithDictionary:data error:nil];
        NSLog(@"responseObject:%@",_liveModel);
        
        [_collectionView reloadData];
        [_collectionView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _liveModel.rooms.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZQHomeCell *cell = (ZQHomeCell *)[collectionView dequeueReusableCellWithReuseIdentifier:liveCellId forIndexPath:indexPath];
    List *list = _liveModel.rooms[indexPath.row];
    cell.list = list;
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ZQRoomViewController *roomVCtrl = [[ZQRoomViewController alloc] init];
    ZQHomeCell *cell = (ZQHomeCell *)[collectionView cellForItemAtIndexPath:indexPath];
    roomVCtrl.list = cell.list;
    [self.navigationController pushViewController:roomVCtrl animated:YES];
}

@end
