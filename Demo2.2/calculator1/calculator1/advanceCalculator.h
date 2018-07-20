//
//  advanceCalculator.h
//  calculator1
//
//  Created by ZH on 17-11-7.
//  Copyright (c) 2017年 ZH. All rights reserved.
//

#import "Calculator.h"
#include <math.h>
@interface advanceCalculator : Calculator
@property (strong,nonatomic) NSMutableString* screen;
-(NSString*)sqrt:(NSString*)content;
-(NSString*)abs:(NSString*)content;
-(NSString*)sin:(NSString*)content;
-(NSString*)cos:(NSString*)content;
-(NSString*)tan:(NSString*)content;
-(NSString*)asin:(NSString*)content;
-(NSString*)acos:(NSString*)content;
-(NSString*)atan:(NSString*)content;
-(NSString*)ln:(NSString*)content;
-(NSString*)lg:(NSString*)content;
-(NSString*)pow:(NSString*)content andExp:(double)y;
-(NSString*)fac:(NSString*)content;

-(void)clearScreen;
@end
