//
//  KetangUtility.h
//  MyNote
//
//  Created by yangjing on 2019/2/25.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KetangUtility : NSObject

+(NSNumber *)timestamp;
+(NSMutableDictionary *)dateThen:(NSNumber *)timestamp;

+(CGFloat)screenWidth;
+(CGFloat)screenHeight;

@end
