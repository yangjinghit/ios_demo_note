//
//  KetangPersistentManager.h
//  MyNote
//
//  Created by yangjing on 2019/2/22.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KetangPersistentManager : NSObject

+(id)getMoment;
+(BOOL)saveDictionary:(NSDictionary *)dictionary;
+(BOOL)saveMoment:(NSArray *)moment;

@end
