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
         requestName:(NSString *)requestName
       successAction:(void (^)(id object, NSString *requestName, NDGPRequest *gpRequest))successAction
          failAction:(void (^)(NSError *error, id object, NSString *requestName, NDGPRequest *gpRequest))failAction
{
    [gpRequest startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request)
     {
         NSLog(@"request.respnseString: %@",request.responseString);
         
         id object = [gpRequest model];
         NDGPModel *model = (NDGPModel *)object;
         model.requestName = requestName;
         
         if (successAction)
         {
             successAction(model, requestName, gpRequest);
         }
         
     }failure:^(YTKBaseRequest *request)
     {
         NSError *error = gpRequest.requestOperation.error;
         id object = [gpRequest model];
         NDGPModel *model = (NDGPModel *)object;
         model.requestName = requestName;
         
         if (failAction)
         {
             failAction(error, model, requestName, gpRequest);
         }
     }];
    
}

@end
