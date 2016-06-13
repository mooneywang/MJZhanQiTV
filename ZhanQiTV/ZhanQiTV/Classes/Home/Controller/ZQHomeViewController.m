//
//  ZQHomeViewController.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/08.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQHomeViewController.h"
#import "ZQConstants.h"

@interface ZQHomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ZQHomeViewController

float const kMinimumLineSpacing = 10;
float const kMinimumInteritemSpacing = 10;
float const kCellBaseH = 135;
static NSString *const homeCellId = @"homeCellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupCollectionView];
}

- (void)setupCollectionView {
    CGFloat kDeviceFactor = kScreenH >= 568 ? 1.0 : kScreenH / 568.0;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((kScreenW - 3 * kMinimumInteritemSpacing) * 0.5, kCellBaseH * kDeviceFactor);
    flowLayout.minimumLineSpacing = kMinimumLineSpacing;
    flowLayout.minimumInteritemSpacing = kMinimumInteritemSpacing;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kMarginTopH, kScreenW, kScreenH - kMarginTopH - kTabBarH) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = kGlobalBackgroundColor;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:homeCellId];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeCellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end
