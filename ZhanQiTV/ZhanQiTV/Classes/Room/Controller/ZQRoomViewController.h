//
//  ZQRoomViewController.h
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/15.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class List;
@class RoomModel;

@interface ZQRoomViewController : UIViewController

@property (nonatomic, strong) List *list;
@property (nonatomic, strong) RoomModel *roomModel;

@end
