//
//  NDPresenter.m
//  NDMVPProject
//
//  Created by NDMAC on 15/12/31.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import "NDPresenter.h"

#import "NDGPRequest.h"
#import "NDRequestManager.h"
#import "NDAppModel.h"

@implementation NDPresenter

- (void)requestAppVersionsDataWithType:(NSString *)type
                             Bundle_id:(NSString *)bundle_id
                             Api_token:(NSString *)api_token
{
    NSDictionary * parameters = [ NSDictionary dictionaryWithObjectsAndKeys:type, @"type" ,bundle_id, @"bundle_id" ,api_token, @"api_token" , nil ];
    
    NDGPRequest *request = [NDGPRequest GPRequestWithOperationType:nil requestName:@"versionData"parameters:parameters];
    request.modelClass = [NDAppModel class];
    
    NDRequestManager *manager = [[NDRequestManager alloc] init];
    
    __weak __typeof(self) weakSelf = self;
    [manager startRequest:request
            successAction:^(id object, NSString *requestName, NDGPRequest *gpRequest) {
                                                  NDAppModel *model = (NDAppModel *)object;                                                  
                                                  if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(presenter:appVersionsData:)])
                                                  {
                                                      [weakSelf.delegate presenter:weakSelf appVersionsData:model];
                                                  }
                                              }
               failAction:^(NSError *error, id object, NSString *requestName, NDGPRequest *gpRequest) {
                                                  NSLog(@"Error: %@",error);
                                                  NDAppModel *model = (NDAppModel *)object;
                                                  if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(presenter:appVersionsData:)])
                                                  {
                                                      [weakSelf.delegate presenter:weakSelf appVersionsData:model];
                                                  }
                                              }];
}

@end
