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

- (void)startRequest:(NDGPRequest *)request
         requestType:(NSString *)requestType
           parameter:(id)parameter
           otherInfo:(id)otherInfo
       successAction:(void (^)(id object, NDGPRequest *request))successAction
          failAction:(void (^)(NSError *error, NDGPRequest *request))failAction;


@end
