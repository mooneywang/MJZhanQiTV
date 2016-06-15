//
//  ZQFirstSectionHeader.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/14.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQFirstSectionHeader.h"
#import "ZQConstants.h"
#import "ZQPictureView.h"
#import "ZQAdModel.h"

#define kImageViewCount 3

@interface ZQFirstSectionHeader () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) ZQPictureView *imageViewL;
@property (nonatomic, strong) ZQPictureView *imageViewC;
@property (nonatomic, strong) ZQPictureView *imageViewR;
@property (nonatomic, strong) UIPageControl *pageController;
// 当前图片索引
@property (nonatomic, assign) NSUInteger currentImageIndex;
// 图片总数
@property (nonatomic, assign) NSUInteger imageCount;

@end

@implementation ZQFirstSectionHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self addSubViews];
        [self addGesture];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.userInteractionEnabled = YES;
        [self addSubViews];
        [self addGesture];
    }
    return self;
}

- (void)addSubViews {
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    _imageViewL = [[ZQPictureView alloc] init];
    _imageViewL.contentMode = UIViewContentModeScaleToFill;
    [_scrollView addSubview:_imageViewL];
    
    _imageViewC = [[ZQPictureView alloc] init];
    _imageViewC.contentMode = UIViewContentModeScaleToFill;
    [_scrollView addSubview:_imageViewC];
    
    _imageViewR = [[ZQPictureView alloc] init];
    _imageViewR.contentMode = UIViewContentModeScaleToFill;
    [_scrollView addSubview:_imageViewR];
    
    _pageController = [[UIPageControl alloc] init];
    _pageController.userInteractionEnabled = NO;
    [self addSubview:_pageController];
}

- (void)addGesture {
    // 注意多个View不能共用一个手势，此处只需要给_imageViewC添加手势，因为只能点击当前显示的图片
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [_imageViewC addGestureRecognizer:tapG];
}

- (void)tapAction:(UITapGestureRecognizer *)gesture {
    ZQPictureView *pictureView = (ZQPictureView *)gesture.view;
    if ([self.delegate respondsToSelector:@selector(firstSectionHeader:didClickedPictureView:)]) {
        [self.delegate firstSectionHeader:self didClickedPictureView:pictureView];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _scrollView.frame = self.bounds;
    // 垂直方向不需滚动直接设置为0
    _scrollView.contentSize = CGSizeMake(kScreenW * kImageViewCount, 0);
    self.imageViewL.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    self.imageViewC.frame = CGRectMake(kScreenW, 0, self.bounds.size.width, self.bounds.size.height);
    self.imageViewR.frame = CGRectMake(kScreenW * 2, 0, self.bounds.size.width, self.bounds.size.height);
    self.pageController.center = CGPointMake(kScreenW * 0.5, self.bounds.size.height * 0.9);
}

- (void)setAdModelList:(NSArray *)adModelList {
    _adModelList = adModelList;
    _imageCount = adModelList.count;
    // 滚动scrollView至中间（显示中间一个UIImageView）
    [self.scrollView setContentOffset:CGPointMake(kScreenW, 0) animated:YES];
    self.pageController.numberOfPages = _imageCount;
    // 设置最后一张、第一张以及第二张图片，分别对应左中右三个ZQPictureView
    AdModel *adModelL = adModelList[_imageCount - 1];
    _imageViewL.adModel = adModelL;
    AdModel *adModelC = adModelList[0];
    _imageViewC.adModel = adModelC;
    AdModel *adModelR = adModelList[1];
    _imageViewR.adModel = adModelR;
}

-(void)reloadImage{
    NSUInteger leftImageIndex, rightImageIndex;
    CGPoint offset = [self.scrollView contentOffset];
    
    if (offset.x > kScreenW) { // 向右滑动
        _currentImageIndex = (_currentImageIndex + 1) % _imageCount;
    } else if (offset.x < kScreenW) { //　向左滑动
        _currentImageIndex = (_currentImageIndex + _imageCount -1) % _imageCount;
    }
    leftImageIndex = (_currentImageIndex + _imageCount-1) % _imageCount;
    rightImageIndex = (_currentImageIndex + 1) % _imageCount;
    AdModel *adModelC = (AdModel *)_adModelList[_currentImageIndex];
    _imageViewC.adModel = adModelC;
    AdModel *adModelR = (AdModel *)_adModelList[rightImageIndex];
    _imageViewR.adModel = adModelR;
    AdModel *adModelL = (AdModel *)_adModelList[leftImageIndex];
    _imageViewL.adModel = adModelL;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSUInteger currentPage = _currentImageIndex;
    if (scrollView.contentOffset.x >= kScreenW * 1.5) {
        currentPage += 1;
    }else if (scrollView.contentOffset.x <= kScreenW * 0.5) {
        currentPage -= 1;
    }
    self.pageController.currentPage = currentPage;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //重新加载图片
    [self reloadImage];
    //移动到中间
    [_scrollView setContentOffset:CGPointMake(kScreenW, 0) animated:NO];
}

@end
