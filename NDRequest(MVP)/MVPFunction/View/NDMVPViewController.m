//
//  NDMVPViewController.m
//  NDRequest(MVP)
//
//  Created by NDMAC on 15/12/31.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import "NDMVPViewController.h"

#import "NDPresenter.h"

@interface NDMVPViewController ()

@end

@implementation NDMVPViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.presenter requestAppVersionsDataWithType:@"ios" Bundle_id:@"cn.com.xingze.yuto" Api_token:@"629b86afb6c99c130812337434110ef3"];
    
}

#pragma mark - overwrite

#pragma mark - public

#pragma mark - delegate

#pragma mark - notification

#pragma mark - event response

#pragma mark - private

#pragma mark - getter and setter

- (NDPresenter *)presenter{
    if (_presenter) {
        return _presenter;
    }
    
    _presenter = [[NDPresenter alloc] init];
    return _presenter;
}



@end
