//
//  KetangUtility.m
//  MyNote
//
//  Created by yangjing on 2019/2/25.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import "KetangUtility.h"

@implementation KetangUtility

+(NSNumber *)timestamp{
    
    NSDate *now = [NSDate date];
    NSTimeInterval timestampValue = [now timeIntervalSince1970];
    NSNumber *timestamp = [NSNumber numberWithLongLong:timestampValue];
    return timestamp;
}

+ (NSMutableDictionary *)dateThen:(NSNumber *)timestamp{
    
    NSTimeInterval seconds = [timestamp doubleValue];
    NSDate *dateThen = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:dateThen];
    NSDate *localeDate = [dateThen dateByAddingTimeInterval:interval];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |
            NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;
    comps = [calendar components:unitFlags fromDate:localeDate];
    long weekNumber = [comps weekday];
    long day = [comps day];
    long year = [comps year];
    long month = [comps month];
    
    NSString *weekDay;
    switch (weekNumber) {
        case 1:
            weekDay = @"星期日";
            break;
        case 2:
            weekDay = @"星期一";
            break;
        case 3:
            weekDay = @"星期二";
            break;
        case 4:
            weekDay = @"星期三";
            break;
        case 5:
            weekDay = @"星期四";
            break;
        case 6:
            weekDay = @"星期五";
            break;
        case 7:
            weekDay = @"星期六";
            break;
            
        default:
            break;
    }
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       [NSString stringWithFormat:@"%ld", day], @"day",
                                       [NSString stringWithFormat:@"%@", weekDay], @"dayOfWeek",
                                       [NSString stringWithFormat:@"%ld", year], @"year",
                                       [NSString stringWithFormat:@"%ld", month], @"month",
                                       nil];
    
    return dictionary;
    
}

+ (CGFloat)screenWidth{
    
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)screenHeight{
    
    return [UIScreen mainScreen].bounds.size.height;
}



@end
