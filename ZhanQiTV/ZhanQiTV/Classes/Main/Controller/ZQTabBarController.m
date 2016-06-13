//
//  ZQTabBarController.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 16/6/8.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQTabBarController.h"
#import "ZQNavigationController.h"
#import "ZQHomeViewController.h"
#import "ZQBaseViewController.h"

@interface ZQTabBarController ()

@end

@implementation ZQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self addChildViewControllers];
}

- (void)addChildViewControllers {
    // 首页
    ZQHomeViewController *homeVCtrl = [[ZQHomeViewController alloc] init];
    [self addChildViewController:homeVCtrl withTitle:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_sel"];
    
    // 直播
    ZQBaseViewController *roomVCtrl = [[ZQBaseViewController alloc] init];
    [self addChildViewController:roomVCtrl withTitle:@"直播" imageName:@"tabbar_room" selectedImageName:@"tabbar_room_sel"];
    
    // 游戏
    ZQBaseViewController *gameVCtrl = [[ZQBaseViewController alloc] init];
    [self addChildViewController:gameVCtrl withTitle:@"游戏" imageName:@"tabbar_game" selectedImageName:@"tabbar_game_sel"];
    
    // 我的
    ZQBaseViewController *mineVCtrl = [[ZQBaseViewController alloc] init];
    [self addChildViewController:mineVCtrl withTitle:@"我的" imageName:@"tabbar_me" selectedImageName:@"tabbar_me_sel"];
}

- (void)addChildViewController:(UIViewController *)viewController withTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ZQNavigationController *naviCtrl = [[ZQNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:naviCtrl];
}

@end
