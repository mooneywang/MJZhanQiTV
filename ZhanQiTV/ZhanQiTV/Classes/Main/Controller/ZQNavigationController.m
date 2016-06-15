//
//  ZQNavigationController.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 16/6/8.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQNavigationController.h"

@interface ZQNavigationController ()

@end

@implementation ZQNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
