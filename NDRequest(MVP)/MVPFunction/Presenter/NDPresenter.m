//
//  NDPresenter.m
//  NDRequest(MVP)
//
//  Created by NDMAC on 15/12/31.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import "NDPresenter.h"

#import "NDGPRequest.h"
#import "NDRequestManager.h"
@implementation NDPresenter


- (void)requestAppVersionsDataWithType:(NSString *)type
                             Bundle_id:(NSString *)bundle_id
                             Api_token:(NSString *)api_token
{
    NSDictionary * parameters = [ NSDictionary dictionaryWithObjectsAndKeys:type, @"type" ,bundle_id, @"bundle_id" ,api_token, @"api_token" , nil ];
    
    NDGPRequest *request = [NDGPRequest GPRequestWithOperationType:nil parameters:parameters];
    
    
    [[NDRequestManager sharedNDRequestManager] startRequest:request
                                                requestName:@"versionData"
                                              successAction:^(id object, NSString *requestName, NDGPRequest *gpRequest) {
                                                
                                              } failAction:^(NSError *error, NSString *requestName, NDGPRequest *gpRequest) {
                                                  
                                              }];
    
}

@end
