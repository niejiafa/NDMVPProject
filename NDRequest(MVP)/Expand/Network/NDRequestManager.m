//
//  NDRequestManager.m
//  NDRequest(MVP)
//
//  Created by NDMAC on 15/12/31.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import "NDRequestManager.h"

#import "NDGPRequest.h"
#import "NDGPModel.h"
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

- (void)startRequest:(NDGPRequest *)gpRequest
         requestName:(NSString *)requestName
       successAction:(void (^)(id object, NSString *requestName, NDGPRequest *gpRequest))successAction
          failAction:(void (^)(NSError *error, id object, NSString *requestName, NDGPRequest *gpRequest))failAction
{
    [gpRequest startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request)
     {
         NSLog(@"request.respnseString: %@",request.responseString);
         
         id object = [gpRequest model];
         
         if (successAction)
         {
             successAction(object, requestName, gpRequest);
         }
         
     }failure:^(YTKBaseRequest *request)
     {
         NSError *error = gpRequest.requestOperation.error;
         
         id object = [gpRequest model];
         
         if (failAction)
         {
             failAction(error, object, requestName, gpRequest);
         }
     }];
    
}

@end
