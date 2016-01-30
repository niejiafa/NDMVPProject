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

- (void)startRequest:(NDGPRequest *)gpRequest
       successAction:(void (^)(id object, NSString *requestName, NDGPRequest *gpRequest))successAction
          failAction:(void (^)(NSError *error, id object, NSString *requestName, NDGPRequest *gpRequest))failAction
{
    [gpRequest startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request)
     {
         NDGPRequest *gpRequest = (NDGPRequest *)request;
         
         id object = [gpRequest model];
         NDGPModel *model = (NDGPModel *)object;
         
         model.requestName = gpRequest.requestName;
         
         if (successAction)
         {
             successAction(model, gpRequest.requestName, gpRequest);
         }
         
     }failure:^(YTKBaseRequest *request)
     {
         NSError *error = gpRequest.requestOperation.error;
         id object = gpRequest.ndCacheModel;
         NDGPModel *model = (NDGPModel *)object;
         model.requestName = gpRequest.requestName;
         
         if (failAction)
         {
             failAction(error, model, gpRequest.requestName, gpRequest);
         }
     }];
    
}

@end
