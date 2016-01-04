//
//  NDRequest.m
//  NDArchitecturePro
//
//  Created by NDMAC on 15/12/30.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import "NDRequest.h"

#import "NDModel.h"
#import "NSString+ND.h"

@interface NDRequest()

@property (nonatomic, strong) id ndCacheModel;

@end

@implementation NDRequest

#pragma mark - overwrite

- (void)requestCompleteFilter
{
    if (!self.isSaveToMemory && !self.isSaveToDisk)
    {
        return;
    }
    
    id model = [self ndConvertToModel:[self responseString]];
    
    NSInteger updateCount;
    model = [self ndOperateWithNewObject:model oldObject:self.ndCacheModel updateCount:&updateCount];
    
    if (![self ndSuccessForBussiness:model])
    {
        return;
    }
    
    if (self.isSaveToMemory)
    {
        self.ndCacheModel = model;
    }
    
    if (self.isSaveToDisk)
    {
        [self ndSaveObjectToDiskCache:model];
    }
}

#pragma mark - private

- (void)nd_CheckDirectory:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir;
    if (![fileManager fileExistsAtPath:path isDirectory:&isDir])
    {
        [self nd_createBaseDirectoryAtPath:path];
    }
    else
    {
        if (!isDir)
        {
            NSError *error = nil;
            [fileManager removeItemAtPath:path error:&error];
            [self nd_createBaseDirectoryAtPath:path];
        }
    }
}

- (void)nd_createBaseDirectoryAtPath:(NSString *)path
{
    __autoreleasing NSError *error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:path
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:&error];
    if (error) {
        
    } else {
        
    }
}

#pragma mark - public

// get cache
- (id)model
{
    if (self.ndCacheModel)
    {
        return self.ndCacheModel;
    }
    
    id model = [self ndConvertToModel:self.responseString];
    return model;
}

// save cache
- (BOOL)ndSaveObjectToDiskCache:(id)object
{
    NSParameterAssert(object);
    
    if (!object)
    {
        return YES;
    }
    
    NSString *filePath = [self ndSavedFilePath];
    BOOL success = [NSKeyedArchiver archiveRootObject:object toFile:filePath];
    return success;
}

- (BOOL)ndHaveDiskCache
{
    NSString *filePath = [self ndSavedFilePath];
    BOOL fileExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    return fileExist;
}

// remove cache
- (void)ndRemoveMemoryCache
{
    self.ndCacheModel = nil;
}

- (void)ndRemoveDiskCache
{
    NSString *filePath = [self ndSavedFilePath];
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
    if (error)
    {
    } else {
    }
}

- (void)ndRemoveAllCache
{
    [self ndRemoveMemoryCache];
    [self ndRemoveDiskCache];
}

// convert and operate
- (id)ndConvertToModel:(NSString *)JSONString
{
    id model = [self.modelClass yy_modelWithJSON:JSONString];
    return model;
}

- (id)ndOperateWithNewObject:(id)newObject
                   oldObject:(id)oldObject
                 updateCount:(NSInteger *)updateCount
{
    *updateCount = 1;
    return newObject;
}

- (BOOL)ndSuccessForBussiness:(id)model
{
    return NO;
}

// file config
- (NSString *)ndSavedFilePath
{
    NSString *directory = [self ndSavedFileDirectory];
    NSString *fileName = [self ndSavedFileName];
    NSString *filePath = [directory stringByAppendingPathComponent:fileName];
    return filePath;
}

- (NSString *)ndSavedFileDirectory
{
    NSString *cachesDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    cachesDirectory = [cachesDirectory stringByAppendingPathComponent:@"NDRequest"];
    
    if (self.userCacheDirectory)
    {
        cachesDirectory = [cachesDirectory stringByAppendingPathComponent:self.userCacheDirectory];
    }
    
    [self nd_CheckDirectory:cachesDirectory];
    
    return cachesDirectory;
}

- (NSString *)ndSavedFileName
{
    NSString *baseUrl = [self baseUrl];
    NSString *requestUrl = [self requestUrl];
    id argument = [self requestArgument];
    NSString *requestInfo = [NSString stringWithFormat:@"Method:%ld Host:%@ Url:%@ Argument:%@ Sensitive:%@",
                             (long)[self requestMethod], baseUrl, requestUrl,
                             argument, [self ndSavedSensitiveData]];
    NSString *cacheFileName = [requestInfo nd_md5String];
    return cacheFileName;
}

- (NSString *)ndSavedSensitiveData
{
    return @"";
}

#pragma mark - getter and setter

- (id)ndCacheModel{
    
    if (_ndCacheModel)
    {
        return _ndCacheModel;
    }
    
    NSString *filePath = [self ndSavedFilePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath isDirectory:nil])
    {
        _ndCacheModel = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    }
    
    return _ndCacheModel;
}

@end
