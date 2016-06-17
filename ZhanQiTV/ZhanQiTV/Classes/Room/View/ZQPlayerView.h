//
//  ZQPlayerView.h
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/16.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQPlayerView : UIView

/**  播放地址 */
@property (nonatomic, copy) NSString *urlString;

/**  是否正在播放 */
@property (nonatomic, assign) BOOL isPlaying;

@end
