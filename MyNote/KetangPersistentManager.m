//
//  KetangPersistentManager.m
//  MyNote
//
//  Created by yangjing on 2019/2/22.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import "KetangPersistentManager.h"

@implementation KetangPersistentManager

+ (BOOL)saveDictionary:(NSDictionary *)dictionary{
    id array = [KetangPersistentManager getMoment];
    
    if (array != nil) {
        
        NSMutableArray *moments = [NSMutableArray arrayWithArray:array];
        
        [moments addObject:dictionary];
        return [KetangPersistentManager saveMoment:moments];
        
    }
    
    return NO;
    
}

+(id)getMoment{
    
    NSArray *docsDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dirPath = docsDir[0];
    NSString *dataFilePath = [[NSString alloc] initWithString:[dirPath stringByAppendingPathComponent:@"moment"]];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    @try{
        
//        NSException *e = [NSException exceptionWithName:@"error" reason:nil userInfo:nil];
//        @throw e;
//        
        BOOL fileExist = [manager fileExistsAtPath:dataFilePath];
        
        if (fileExist) {
            NSArray *moment = [NSKeyedUnarchiver unarchiveObjectWithFile:dataFilePath];
            return moment;
        } else {
            NSArray *moment = [[NSArray alloc] init];
            return moment;
        }
        
    }
    @catch(NSException *exception) {
        return nil;
    }
    @finally {
        
    }
}

+ (BOOL)saveMoment:(NSArray *)moment{
    
    NSArray *docsDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dirPath = docsDir[0];
    NSString *dataFilePath = [[NSString alloc] initWithString:[dirPath stringByAppendingPathComponent:@"moment"]];
    
    @try{
        BOOL saveSuccess = [NSKeyedArchiver archiveRootObject:moment toFile:dataFilePath];
        return saveSuccess;
        
        
    }
    @catch(NSException *exception) {
        return NO;
    }
    @finally {
        
    }
    
}

@end
