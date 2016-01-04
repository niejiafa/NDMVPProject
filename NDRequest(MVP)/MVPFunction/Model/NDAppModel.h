//
//  NDAppModel.h
//  NDRequest(MVP)
//
//  Created by NDMAC on 16/1/4.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDGPModel.h"

@class NDAppIconModel;
@class NDAppBinaryModel;

@interface NDAppModel : NDGPModel

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *SHORT;
@property (nonatomic, copy) NDAppIconModel *iconModel;
@property (nonatomic, copy) NDAppBinaryModel *binaryModel;


@end
