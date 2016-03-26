//
//  NDAppModel.m
//  NDMVPProject
//
//  Created by NDMAC on 16/1/4.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDAppModel.h"

@implementation NDAppModel

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{@"ID":@"id",
             @"SHORT":@"short",
             @"iconModel" : @"cert.icon",
             @"binaryModel" : @"cert.binary"
             };
}

@end
