//
//  ZQFirstSectionHeader.h
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/14.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQFirstSectionHeader;
@class ZQPictureView;

@protocol ZQFirstSectionHeaderProtocol <NSObject>

@optional
- (void)firstSectionHeader:(ZQFirstSectionHeader *)firstSectionHeader didClickedPictureView:(ZQPictureView *)pictureView;

@end

@interface ZQFirstSectionHeader : UICollectionReusableView

@property (nonatomic, weak) id<ZQFirstSectionHeaderProtocol> delegate;

@property (nonatomic, strong) NSArray *adModelList;

@end
