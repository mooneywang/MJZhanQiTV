//
//  ZQAdModel.h
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/14.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol AdModel @end

@interface IsStar : JSONModel
@property (nonatomic, assign) BOOL isWeek;
@property (nonatomic, assign) BOOL isMonth;
@end

@interface RoomModel : JSONModel
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
@property (nonatomic, copy) NSString *templat;
@property (nonatomic, copy) NSString *online;
@property (nonatomic, copy) NSString *weight;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *hotsLevel;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *liveTime;
@property (nonatomic, copy) NSString *verscr;
@property (nonatomic, copy) NSString *allowRecord;
@property (nonatomic, copy) NSString *allowVideo;
@property (nonatomic, copy) NSString *publishUrl;
@property (nonatomic, copy) NSString *videoId;
@property (nonatomic, copy) NSString *chatStatus;
@property (nonatomic, copy) NSString *roomNotice;
@property (nonatomic, copy) NSString *anchorNotice;
@property (nonatomic, copy) NSString *roomCover;
@property (nonatomic, copy) NSString *roomCoverType;
@property (nonatomic, copy) NSString *editTime;
@property (nonatomic, copy) NSString *addTime;
@property (nonatomic, copy) NSString *gameName;
@property (nonatomic, copy) NSString *gameUrl;
@property (nonatomic, copy) NSString *gameIcon;
@property (nonatomic, copy) NSString *gameBpic;
@property (nonatomic, copy) NSString *videoIdKey;
@property (nonatomic, copy) NSString *fansTitle;
@property (nonatomic, copy) NSString *translateLanguages;
@property (nonatomic, copy) NSString *follows;
@property (nonatomic, copy) NSString *fans;
@property (nonatomic, strong) IsStar *isStar;
@property (nonatomic, assign) BOOL bonus;
@end

@interface AdModel : JSONModel
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *position;
@property (nonatomic, copy) NSString *chnId;
@property (nonatomic, copy) NSString *roomId;
@property (nonatomic, copy) NSString *matchId;
@property (nonatomic, copy) NSString *gameId;
@property (nonatomic, copy) NSString *spic;
@property (nonatomic, copy) NSString *bpic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *contents;
@property (nonatomic, copy) NSString *startTime;
@property (nonatomic, copy) NSString *endTime;
@property (nonatomic, copy) NSString *weight;
@property (nonatomic, copy) NSString *positionType;
@property (nonatomic, strong) RoomModel *room;
@end

@interface AdSuperModel : JSONModel
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) NSArray<AdModel> *data;
@end
