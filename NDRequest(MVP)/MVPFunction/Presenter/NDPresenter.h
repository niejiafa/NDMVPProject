//
//  NDPresenter.h
//  NDRequest(MVP)
//
//  Created by NDMAC on 15/12/31.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NDPresenter;
@class NDAppModel;

@protocol NDPresenterDelegate <NSObject>

- (void)presenter:(NDPresenter *)presenter appVersionsData:(NDAppModel *)model;

@end

@interface NDPresenter : NSObject

@property (nonatomic, weak) id<NDPresenterDelegate> delegate;

/**
 *  请求app版本信息。
 *
 *  @param  type 设备类型
 *  @param  bundle_id  Bundle identifier
 *  @param  api_token api令牌
 *
 */
- (void)requestAppVersionsDataWithType:(NSString *)type
                             Bundle_id:(NSString *)bundle_id
                             Api_token:(NSString *)api_token;


@end
