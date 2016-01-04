//
//  NDRequestManager.h
//  NDRequest(MVP)
//
//  Created by NDMAC on 15/12/31.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NDGPRequest;

@interface NDRequestManager : NSObject

+ (instancetype)sharedNDRequestManager;

- (void)startRequest:(NDGPRequest *)gpRequest
         requestName:(NSString *)requestName
       successAction:(void (^)(id object, NSString *requestName, NDGPRequest *gpRequest))successAction
          failAction:(void (^)(NSError *error, NSString *requestName, NDGPRequest *gpRequest))failAction;


@end
