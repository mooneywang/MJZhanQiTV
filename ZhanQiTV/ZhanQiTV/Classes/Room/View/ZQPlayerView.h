//
//  ZQPlayerView.h
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/16.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZQPlayerViewDelegate <NSObject>

@optional
- (void)playerViewDidClickBackButton;
- (void)playerViewDidClickFullScreenButton:(UIButton *)sender;

@end

@interface ZQPlayerView : UIView

@property (nonatomic, weak) id<ZQPlayerViewDelegate> delegate;

/**  播放地址 */
@property (nonatomic, copy) NSString *urlString;

/**  是否正在播放 */
@property (nonatomic, assign) BOOL isPlaying;

@end
