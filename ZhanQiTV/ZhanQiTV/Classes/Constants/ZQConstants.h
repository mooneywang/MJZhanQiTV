//
//  ZQConstants.h
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/12.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#ifndef ZQCONSTANTS_H
#define ZQCONSTANTS_H

#define kStatusBarH                20
#define kNavigationBarH            44
#define kMarginTopH                64
#define kTabBarH                   49
#define kScreenH                   [[UIScreen mainScreen] bounds].size.height
#define kScreenW                   [[UIScreen mainScreen] bounds].size.width

#ifdef DEBUG
#define ZQLog(...)                 NSLog(__VA_ARGS__)
#else
#define ZQLog(...)
#endif
#define ZQLogFunc                  ZQLog(@"%s", __func__)
#define ZQRGBColor(r, g, b, a)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define kGlobalBackgroundColor    ZQRGBColor(246, 246, 246, 1)

#endif

