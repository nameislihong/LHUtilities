//
//  UIView+LHUtilities.m
//  LHUtilities
//
//  Created by xcode on 13-6-4.
//  Copyright (c) 2013年 xcode. All rights reserved.
//

#import "UIView+LHUtilities.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (LHUtilities)

-(void)makeShadowwithRadius:(float)radius
{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.4f;
    self.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
    self.layer.shadowRadius = 3.0f;
    self.layer.masksToBounds = NO;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
    self.layer.shadowPath = path.CGPath;
}

@end
