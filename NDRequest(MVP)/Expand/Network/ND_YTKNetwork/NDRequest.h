//
//  NDRequest.h
//  NDArchitecturePro
//
//  Created by NDMAC on 15/12/30.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import "YTKBaseRequest.h"

@interface NDRequest : YTKBaseRequest

@property (nonatomic, assign) BOOL isSaveToMemory;
@property (nonatomic, assign) BOOL isSaveToDisk;

@property (nonatomic, copy) NSString *userCacheDirectory;

@property (nonatomic, strong) Class modelClass;

// get cache
- (id)model;

// save cache
- (BOOL)ndSaveObjectToDiskCache:(id)object;
- (BOOL)ndHaveDiskCache;

// remove cache
- (void)ndRemoveMemoryCache;
- (void)ndRemoveDiskCache;
- (void)ndRemoveAllCache;

// convert and operate
- (id)ndConvertToModel:(NSString *)JSONString;
- (id)ndOperateWithNewObject:(id)newObject
                       oldObject:(id)oldObject
                     updateCount:(NSInteger *)updateCount;

// file config
- (NSString *)ndSavedFilePath;
- (NSString *)ndSavedFileDirectory;
- (NSString *)ndSavedFileName;
- (NSString *)ndSavedSensitiveData;

@end
