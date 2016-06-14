//
//  ZQNetworkManager.h
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/14.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^SuccessBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject);
typedef void(^FailureBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error);
typedef void(^ProgressBlock)(NSProgress * _Nonnull downloadProgress);

@interface ZQNetworkManager : AFHTTPSessionManager

+ (_Nonnull instancetype)sharedManager;

/**
 *  @author Mooney.Wang, 16-06-14 14:06:10
 *
 *  get请求（不带ProgressBlock）
 */
- (void)get:( NSString * _Nullable )urlString parameters:(id _Nullable)parameters success:(_Nullable SuccessBlock)success failure:(_Nullable FailureBlock)failure;

/**
 *  @author Mooney.Wang, 16-06-14 14:06:39
 *
 *  get请求（带ProgressBlock）
 */
- (void)get:( NSString * _Nullable )urlString parameters:(id _Nullable)parameters progress:(_Nullable ProgressBlock)progress success:(_Nullable SuccessBlock)success failure:(_Nullable FailureBlock)failure;

/**
 *  @author Mooney.Wang, 16-06-14 14:06:42
 *
 *  post请求（不带ProgressBlock）
 */
- (void)post:( NSString * _Nullable )urlString parameters:(id _Nullable)parameters success:(_Nullable SuccessBlock)success failure:(_Nullable FailureBlock)failure;

/**
 *  @author Mooney.Wang, 16-06-14 14:06:56
 *
 *  post请求（带ProgressBlock）
 */
- (void)post:( NSString * _Nullable )urlString parameters:(id _Nullable)parameters progress:(_Nullable ProgressBlock)progress success:(_Nullable SuccessBlock)success failure:(_Nullable FailureBlock)failure;

@end
