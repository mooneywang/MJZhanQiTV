//
//  ZQGameViewController.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/21.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQGameViewController.h"
#import "ZQConstants.h"

@interface ZQGameViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ZQGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.itemSize = CGSizeMake((kScreenW - 3 * kMinimumInteritemSpacing) * 0.5, kCellBaseH * kDeviceFactor);
//    flowLayout.minimumLineSpacing = kMinimumLineSpacing;
//    flowLayout.minimumInteritemSpacing = kMinimumInteritemSpacing;
//    flowLayout.sectionInset = UIEdgeInsetsMake(kMinimumLineSpacing, kMinimumLineSpacing, kMinimumLineSpacing, kMinimumLineSpacing);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kMarginTopH, kScreenW, kScreenH - kMarginTopH - kTabBarH) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = kGlobalBackgroundColor;
    _collectionView.showsVerticalScrollIndicator = NO;
//    _collectionView.dataSource = self;
//    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor redColor];
}

@end
