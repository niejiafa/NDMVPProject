
//
//  NDGPRequest.m
//  NDArchitecturePro
//
//  Created by NDMAC on 15/12/30.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import "NDGPRequest.h"

#import "NDGPModel.h"
#import "NDRequest.h"

@implementation NDGPRequest


#pragma mark - life cycle

- (id)initWithOperationType:(NSString *)operationType
                requestName: (NSString *)requestName
                 parameters:(NSDictionary *)parameters
{
    self = [super init];
    if (self)
    {
        self.operationType = operationType;
        self.requestName = requestName;
        self.parameters = parameters;
        
        self.isSaveToMemory = YES;
        self.isSaveToDisk = YES;
        
        self.modelClass = [NDGPModel class];
    }
    
    return self;
}

- (id)initWithOperationType:(NSString *)operationType
                requestName: (NSString *)requestName
                 parameters:(NSDictionary *)parameters
                    baseUrl:(NSString *)baseUrl
                 requestUrl:(NSString *)requestUrl
           requestMethod:(YTKRequestMethod)requestMethod
{
    NDGPRequest *request = [[NDGPRequest alloc] initWithOperationType:operationType requestName:requestName parameters:parameters];
    request.baseUrl = baseUrl;
    request.requestUrl = requestUrl;
    request.gpRequestMethod = requestMethod;
    return request;
    
}

+ (instancetype)GPRequestWithOperationType:(NSString *)operationType
                               requestName: (NSString *)requestName
                                parameters:(NSDictionary *)parameters
{
    NDGPRequest *request = [[NDGPRequest alloc] initWithOperationType:operationType requestName:requestName parameters:parameters];
    return request;
}

+ (instancetype)GPRequestWithOperationType:(NSString *)operationType
                               requestName: (NSString *)requestName
                                parameters:(NSDictionary *)parameters
                                   baseUrl:(NSString *)baseUrl
                                requestUrl:(NSString *)requestUrl
                             requestMethod:(YTKRequestMethod)requestMethod;
{
    NDGPRequest *request = [[NDGPRequest alloc] initWithOperationType:operationType requestName:requestName parameters:parameters baseUrl:baseUrl requestUrl:requestUrl requestMethod:requestMethod];
    return request;
}

- (instancetype)init
{
    NSAssert(NO, @"Use initWithOperationType:parameters: instead of.");
    return nil;
}

#pragma mark - overwrite

- (NSString *)baseUrl
{
    if (_baseUrl) {
        return _baseUrl;
    }
    
    NSString *baseUrl = @"http://api.fir.im";
    _baseUrl = baseUrl;
    return baseUrl;
}

- (NSString *)requestUrl
{
    if (_requestUrl) {
        return _requestUrl;
    }
    
    NSString *requestUrl = @"/apps";
    _requestUrl = requestUrl;
    return requestUrl;
}

- (YTKRequestMethod)requestMethod{
    return self.gpRequestMethod;
}

- (YTKRequestMethod)gpRequestMethod{
    
    if (_gpRequestMethod) {
        return _gpRequestMethod;
    }
    
    YTKRequestMethod gpRequestMethod = YTKRequestMethodPost;
    _gpRequestMethod = gpRequestMethod;
    return YTKRequestMethodPost;
}

- (id)requestArgument
{
    return self.parameters;
}

@end
