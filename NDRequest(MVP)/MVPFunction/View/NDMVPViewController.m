//
//  NDMVPViewController.m
//  NDRequest(MVP)
//
//  Created by NDMAC on 15/12/31.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import "NDMVPViewController.h"

#import "NDPresenter.h"
#import "NDAppModel.h"
#import "NDAppIconModel.h"
#import "NDAppBinaryModel.h"
#import "NDGPRequest.h"
#import "NDRequestManager.h"
#import "NDAppModel.h"

@interface NDMVPViewController () <NDPresenterDelegate>

@end

@implementation NDMVPViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.presenter requestAppVersionsDataWithType:@"ios" Bundle_id:@"cn.com.xingze.yuto" Api_token:@"629b86afb6c99c130812337434110ef3"];
    
    NSDictionary * parameters = [ NSDictionary dictionaryWithObjectsAndKeys:@"ios", @"type" ,@"cn.com.xingze.yuto", @"bundle_id" ,@"629b86afb6c99c130812337434110ef3", @"api_token" , nil ];
    
    NDGPRequest *request = [NDGPRequest GPRequestWithOperationType:nil parameters:parameters];
    request.modelClass = [NDAppModel class];
    
    __weak __typeof(self) weakSelf = self;
    
    [[NDRequestManager sharedNDRequestManager] startRequest:request
                                                requestName:@"versionData"
                                              successAction:^(id object, NSString *requestName, NDGPRequest *gpRequest) {
                                                  
                                                  NDAppModel *model = (NDAppModel *)object;
                                                  
                                              } failAction:^(NSError *error, id object, NSString *requestName, NDGPRequest *gpRequest) {
                                                  NSLog(@"Error: %@",error);
                                                  
                                              }];
}

#pragma mark - overwrite

#pragma mark - public

#pragma mark - delegate

- (void)presenter:(NDPresenter *)presenter appVersionsData:(NDAppModel *)model
{
    self.appTextView.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n\n%@\n\n%@",
                             model.requestName,
                             model.ID,
                             model.type,
                             model.SHORT,
                             [NSString stringWithFormat:@"%@\n%@\n%@\n",model.iconModel.key, model.iconModel.token, model.iconModel.upload_url],
                             [NSString stringWithFormat:@"%@\n%@\n%@\n",model.binaryModel.key, model.binaryModel.token, model.binaryModel.upload_url]
                             ];
}

#pragma mark - notification

#pragma mark - event response

#pragma mark - private

#pragma mark - getter and setter

- (NDPresenter *)presenter{
    if (_presenter) {
        return _presenter;
    }

    _presenter = [[NDPresenter alloc] init];
    _presenter.delegate = self;
    return _presenter;
}

@end
