//
//  ZQPlayerControlView.h
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/17.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZQPlayerControlViewDelegate <NSObject>

@optional
- (void)playerControlViewDidClickBackButton;
- (void)playerControlViewDidClickFullScreenButton:(UIButton *)sender;

@end

@interface ZQPlayerControlView : UIView

@property (nonatomic, weak) id<ZQPlayerControlViewDelegate> delegate;

@end
