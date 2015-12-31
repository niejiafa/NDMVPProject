//
//  NDRequestManager.m
//  NDRequest(MVP)
//
//  Created by NDMAC on 15/12/31.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import "NDRequestManager.h"

#import "NDGPRequest.h"
@implementation NDRequestManager

+ (instancetype)sharedNDRequestManager
{
    static dispatch_once_t onceToken;
    static NDRequestManager *requestManager;
    dispatch_once(&onceToken, ^{
        requestManager = [[NDRequestManager alloc] init];
    });
    return requestManager;
}

- (void)startRequest:(NDGPRequest *)request_
         requestType:(NSString *)requestType
           parameter:(id)parameter
           otherInfo:(id)otherInfo
       successAction:(void (^)(id object, NDGPRequest *request))successAction
          failAction:(void (^)(NSError *error, NDGPRequest *request))failAction
{
    [request_ startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request)
     {
         id object = [request_ model];
         
         if (successAction)
         {
             successAction(object, request_);
         }
         
     }failure:^(YTKBaseRequest *request)
     {
         id object = request_.requestOperation.error;
         
         if (failAction)
         {
             failAction(object, request_);
         }
     }];
    
}

@end
