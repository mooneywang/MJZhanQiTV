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
#import "ZQSectionHeader.h"

@interface ZQHomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ZQHomeViewController

float const kMinimumLineSpacing = 10;
float const kMinimumInteritemSpacing = 10;
float const kCellBaseH = 135;
float kDeviceFactor = 1.0;
static NSString *const homeCellId = @"homeCellId";
static NSString *const homeSectionHeaderId = @"homeSectionHeaderId";
static NSString *const homeFirstSectionHeaderId = @"homeFirstSectionHeaderId";

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupCollectionView];
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
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:homeCellId];
    [_collectionView registerClass:[ZQSectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:homeSectionHeaderId];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:homeFirstSectionHeaderId];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeCellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:1.000 green:0.700 blue:0.722 alpha:1.000];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if (indexPath.section == 0) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:homeFirstSectionHeaderId forIndexPath:indexPath];
        reusableView.backgroundColor = [UIColor colorWithRed:0.000 green:1.000 blue:0.744 alpha:1.000];
    }else {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:homeSectionHeaderId forIndexPath:indexPath];
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

@end
