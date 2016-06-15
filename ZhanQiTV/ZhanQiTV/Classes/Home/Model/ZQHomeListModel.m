//
//  ZQHomeListModel.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/15.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQHomeListModel.h"

@implementation List

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"ID"
                                                       }];
}

@end

@implementation Anchor

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation HomeListModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"ID"
                                                       }];
}

@end

@implementation HomeSuperListModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
