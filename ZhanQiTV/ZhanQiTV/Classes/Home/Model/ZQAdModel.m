//
//  ZQAdModel.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/14.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQAdModel.h"

@implementation IsStar

/**
 *  @author Mooney.Wang, 16-06-14 09:06:32
 *
 *  设置所有的属性值都是Optional
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation RoomModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

/**
 *  @author Mooney.Wang, 16-06-14 09:06:19
 *
 *  设置json字段名和属性名之间的对应关系
 */
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"ID",
                                                       @"template" : @"templat"
                                                       }];
}

@end

@implementation AdModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"ID"
                                                       }];
}

@end

@implementation AdSuperModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end