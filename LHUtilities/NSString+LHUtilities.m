//
//  NSString+LHUtilities.m
//  LHUtilities
//
//  Created by xcode on 13-6-4.
//  Copyright (c) 2013年 xcode. All rights reserved.
//

#import "NSString+LHUtilities.h"

@implementation NSString (LHUtilities)

+(NSString *)timeAgoStringForDate:(NSDate *)date {
    // Data object's TimeCreated property is in UTC
    // - Change it to local time
    NSTimeZone *currentTimeZone = [NSTimeZone defaultTimeZone];
    NSTimeZone *utcTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    int currentGMTOffset = [currentTimeZone secondsFromGMTForDate:date];
    int gmtOffset = [utcTimeZone secondsFromGMTForDate:date];
    NSTimeInterval gmtInterval = currentGMTOffset - gmtOffset;
    NSDate *localDate = [[NSDate alloc] initWithTimeInterval:gmtInterval sinceDate:date];
    
    // Now calculate how long ago it was.
    NSTimeInterval interval = [localDate timeIntervalSinceNow];
    interval = abs(interval);
    NSString *plural = @"";
    
    if (interval < 60) {
        if ((int)interval > 1) {
            plural = @"s";
        }
        return [NSString stringWithFormat:@"%d second%@ ago", (int)interval, plural];
    }
    else if (interval < 3600) {
        if ((int)interval/60 > 1) {
            plural = @"s";
        }
        return [NSString stringWithFormat:@"%d minute%@ ago", (int)interval/60, plural];
    }
    else if (interval < 86400) {
        if ((int)interval/3600 > 1) {
            plural = @"s";
        }
        return [NSString stringWithFormat:@"%d hour%@ ago", (int)interval/3600, plural];
    }
    
    if ((int)interval/86400 > 1) {
        plural = @"s";
    }
    return [NSString stringWithFormat:@"%d day%@ ago", (int)interval/86400, plural];
}


@end
