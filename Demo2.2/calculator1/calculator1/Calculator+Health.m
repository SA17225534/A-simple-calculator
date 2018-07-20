//
//  Calculator+Health.m
//  calculator1
//
//  Created by ZH on 17-11-9.
//  Copyright (c) 2017年 ZH. All rights reserved.
//

#import "Calculator+Health.h"

@implementation Calculator (Health)
-(NSString*)computeHealthWithHeight:(NSString*)height andWeight:(NSString*) weight
{
    NSMutableString *expression;
    expression = [NSMutableString stringWithString:weight];
    [expression appendString:@"/(("];
    [expression appendString:height];
    [expression appendString:@"/100.0)"];
    [expression appendString:@"*("];
    [expression appendString:height];
    [expression appendString:@"/100.0))"];
    self.disp = expression;
    return [NSString stringWithFormat:@"%.2f",[[self computerResult]floatValue]];
}
@end
