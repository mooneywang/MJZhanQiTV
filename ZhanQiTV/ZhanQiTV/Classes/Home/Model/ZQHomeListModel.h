//
//  ZQHomeListModel.h
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/15.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol Anchor @end
@protocol List @end
@protocol HomeListModel @end

@interface List : JSONModel
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *domain;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *gameId;
@property (nonatomic, copy) NSString *spic;
@property (nonatomic, copy) NSString *bpic;
@property (nonatomic, copy) NSString *online;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *liveTime;
@property (nonatomic, copy) NSString *hotsLevel;
@property (nonatomic, copy) NSString *videoId;
@property (nonatomic, copy) NSString *gameName;
@property (nonatomic, copy) NSString *gameUrl;
@property (nonatomic, copy) NSString *gameIcon;
@property (nonatomic, copy) NSString *follows;
@property (nonatomic, copy) NSString *highlight;
@property (nonatomic, copy) NSString *active314;
@property (nonatomic, copy) NSString *colorfulText;
@end

@interface Anchor : JSONModel
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *color;
@end

@interface HomeListModel : JSONModel
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *keyword;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *rtype;
@property (nonatomic, copy) NSString *channelIds;
@property (nonatomic, copy) NSString *roomIds;
@property (nonatomic, copy) NSString *gameIds;
@property (nonatomic, copy) NSString *customLink;
@property (nonatomic, copy) NSString *moreUrl;
@property (nonatomic, copy) NSString *nums;
@property (nonatomic, copy) NSString *weight;
@property (nonatomic, strong) NSArray<Anchor> *anchors;
@property (nonatomic, strong) NSArray<List> *lists;
@end


@interface HomeSuperListModel : JSONModel
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) NSArray<HomeListModel> *data;
@end
