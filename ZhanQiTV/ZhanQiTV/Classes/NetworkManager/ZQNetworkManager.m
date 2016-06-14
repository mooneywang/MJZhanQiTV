//
//  ZQNetworkManager.m
//  ZhanQiTV
//
//  Created by Mengjie.Wang on 2016/06/14.
//  Copyright © 2016年 Mooney.Wang. All rights reserved.
//

#import "ZQNetworkManager.h"

@implementation ZQNetworkManager

static ZQNetworkManager *_manager;

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[ZQNetworkManager alloc] init];
        _manager.requestSerializer.timeoutInterval = 10.0f;
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return _manager;
}

- (void)get:( NSString * _Nullable )urlString parameters:(id _Nullable)parameters success:(_Nullable SuccessBlock)success failure:(_Nullable FailureBlock)failure {
    [_manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task, error);
    }];
}

- (void)get:( NSString * _Nullable )urlString parameters:(id _Nullable)parameters progress:(_Nullable ProgressBlock)progress success:(_Nullable SuccessBlock)success failure:(_Nullable FailureBlock)failure {
    [_manager GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task, error);
    }];
}

- (void)post:( NSString * _Nullable )urlString parameters:(id _Nullable)parameters success:(_Nullable SuccessBlock)success failure:(_Nullable FailureBlock)failure {
    [_manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task, error);
    }];
}

- (void)post:( NSString * _Nullable )urlString parameters:(id _Nullable)parameters progress:(_Nullable ProgressBlock)progress success:(_Nullable SuccessBlock)success failure:(_Nullable FailureBlock)failure {
    [_manager POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task, error);
    }];
}

@end
