//
//  NDRequestManager.h
//  NDMVPProject
//
//  Created by NDMAC on 15/12/31.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NDGPRequest;

@interface NDRequestManager : NSObject

- (void)startRequest:(NDGPRequest *)gpRequest
       successAction:(void (^)(id object, NSString *requestName, NDGPRequest *gpRequest))successAction
          failAction:(void (^)(NSError *error, id object, NSString *requestName, NDGPRequest *gpRequest))failAction;

@end
