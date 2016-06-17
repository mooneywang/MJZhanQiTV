//
//  ZQHomeViewController.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/08.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQHomeViewController.h"
#import "ZQConstants.h"
#import "ZQAPI.h"
#import "ZQFirstSectionHeader.h"
#import "ZQSectionHeader.h"
#import "ZQHomeCell.h"
#import "ZQNetworkManager.h"
#import "ZQAdModel.h"
#import "ZQHomeListModel.h"
#import <MBProgressHUD.h>
#import "ZQRoomViewController.h"
#import "ZQPictureView.h"
#import <MJRefresh.h>
#import "ZQCellConstant.h"

@interface ZQHomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ZQFirstSectionHeaderProtocol>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ZQHomeViewController {
    AdSuperModel *_adSuperModel;
    HomeSuperListModel *_homeSuperListModel;
}

static NSString *const homeCellId = @"homeCellId";
static NSString *const homeSectionHeaderId = @"homeSectionHeaderId";
static NSString *const homeFirstSectionHeaderId = @"homeFirstSectionHeaderId";

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
    [self getAdModel];
}

#pragma mark - private methods

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
    [_collectionView registerClass:[ZQHomeCell class] forCellWithReuseIdentifier:homeCellId];
    [_collectionView registerClass:[ZQSectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:homeSectionHeaderId];
    [_collectionView registerClass:[ZQFirstSectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:homeFirstSectionHeaderId];
    
    // 集成下拉刷新
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 重新获取视频列表
        [self getHomeListModel];
    }];
    // 开始刷新
    [_collectionView.mj_header beginRefreshing];
}

- (void)getAdModel {
    ZQNetworkManager *manager = [ZQNetworkManager sharedManager];
    [manager get:kADUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        _adSuperModel = [[AdSuperModel alloc] initWithDictionary:responseDict error:nil];
        if ([_adSuperModel.code intValue] == 0) {
            [_collectionView reloadData];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = error.localizedDescription;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    }];
}

- (void)getHomeListModel {
    ZQNetworkManager *manager = [ZQNetworkManager sharedManager];
    [manager get:kHomeUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        _homeSuperListModel = [[HomeSuperListModel alloc] initWithDictionary:responseDict error:nil];
        if ([_adSuperModel.code intValue] == 0) {
            [_collectionView reloadData];
        }
        // 结束刷新状态
        [_collectionView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = error.localizedDescription;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
        // 结束刷新状态
        [_collectionView.mj_header endRefreshing];
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _homeSuperListModel.data.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    HomeListModel *homeListModel = _homeSuperListModel.data[section - 1];
    return homeListModel.lists.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZQHomeCell *cell = (ZQHomeCell *)[collectionView dequeueReusableCellWithReuseIdentifier:homeCellId forIndexPath:indexPath];
    HomeListModel *homeListModel = _homeSuperListModel.data[indexPath.section - 1];
    cell.list = homeListModel.lists[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if (indexPath.section == 0) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:homeFirstSectionHeaderId forIndexPath:indexPath];
        ZQFirstSectionHeader *firstSectionHeader = (ZQFirstSectionHeader *)reusableView;
        firstSectionHeader.delegate = self;
        firstSectionHeader.adModelList = _adSuperModel.data;
    }else {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:homeSectionHeaderId forIndexPath:indexPath];
        ZQSectionHeader *sectionHeader = (ZQSectionHeader *)reusableView;
        sectionHeader.homeListModel = _homeSuperListModel.data[indexPath.section - 1];
    }
    return reusableView;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(kScreenW, 220 * kDeviceFactor);
    }else {
        return CGSizeMake(kScreenW, 50 * kDeviceFactor);
    }
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ZQRoomViewController *roomVCtrl = [[ZQRoomViewController alloc] init];
    ZQHomeCell *cell = (ZQHomeCell *)[collectionView cellForItemAtIndexPath:indexPath];
    roomVCtrl.list = cell.list;
    [self.navigationController pushViewController:roomVCtrl animated:YES];
}

#pragma mark - ZQFirstSectionHeaderProtocol

- (void)firstSectionHeader:(ZQFirstSectionHeader *)firstSectionHeader didClickedPictureView:(ZQPictureView *)pictureView {
    ZQRoomViewController *roomVCtrl = [[ZQRoomViewController alloc] init];
    AdModel *adModel = pictureView.adModel;
    roomVCtrl.roomModel = adModel.room;
    [self.navigationController pushViewController:roomVCtrl animated:YES];
}

@end
