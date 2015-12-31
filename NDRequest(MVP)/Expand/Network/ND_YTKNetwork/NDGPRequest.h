//
//  NDGPRequest.h
//  NDArchitecturePro
//
//  Created by NDMAC on 15/12/30.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import "NDRequest.h"

@interface NDGPRequest : NDRequest

@property (nonatomic, strong) NSString *operationType;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic, strong) NSString *requestUrl;
@property (nonatomic, assign) YTKRequestMethod requestMethod;


- (id)initWithOperationType:(NSString *)operationType
                 parameters:(NSDictionary *)parameters;

- (id)initWithOperationType:(NSString *)operationType
                 parameters:(NSDictionary *)parameters
                    baseUrl:(NSString *)baseUrl
                 requestUrl:(NSString *)requestUrl
              requestMethod:(YTKRequestMethod)requestMethod;

+ (instancetype)GPRequestWithOperationType:(NSString *)operationType
                                parameters:(NSDictionary *)parameters;

+ (instancetype)GPRequestWithOperationType:(NSString *)operationType
                                parameters:(NSDictionary *)parameters
                                   baseUrl:(NSString *)baseUrl
                                requestUrl:(NSString *)requestUrl
                             requestMethod:(YTKRequestMethod)requestMethod;


@end
