//
//  advanceCalculator.m
//  calculator1
//
//  Created by ZH on 17-11-7.
//  Copyright (c) 2017年 ZH. All rights reserved.
//

#import "advanceCalculator.h"

@implementation advanceCalculator
-(NSString*)sqrt:(NSString*)content
{
    double d = [content doubleValue];
    double result =sqrt(d);
    NSNumber* n = [[NSNumber alloc]initWithDouble:result];
    return [n stringValue];
}

-(NSString*)abs:(NSString*)content
{
    NSNumber* n = [[NSNumber alloc]initWithDouble:fabs([content doubleValue])];
    return [n stringValue];
}

-(NSString*)sin:(NSString*)content
{
    NSNumber* n = [[NSNumber alloc]initWithDouble:sin([content doubleValue])];
    return [n stringValue];
}

-(NSString*)cos:(NSString*)content
{
    NSNumber* n = [[NSNumber alloc]initWithDouble:cos([content doubleValue])];
    return [n stringValue];
}

-(NSString*)tan:(NSString*)content
{
    NSNumber* n = [[NSNumber alloc]initWithDouble:tan([content doubleValue])];
    return [n stringValue];
}

-(NSString*)asin:(NSString*)content
{
    NSNumber* n = [[NSNumber alloc]initWithDouble:asin([content doubleValue])];
    return [n stringValue];
}

-(NSString*)acos:(NSString*)content
{
    NSNumber* n = [[NSNumber alloc]initWithDouble:acos([content doubleValue])];
    return [n stringValue];
}

-(NSString*)atan:(NSString*)content
{
    NSNumber* n = [[NSNumber alloc]initWithDouble:atan([content doubleValue])];
    return [n stringValue];
}

-(NSString*)ln:(NSString*)content
{
    NSNumber* n = [[NSNumber alloc]initWithDouble:log([content doubleValue])];
    return [n stringValue];
}

-(NSString*)lg:(NSString*)content
{
    NSNumber* n = [[NSNumber alloc]initWithDouble:log10([content doubleValue])];
    return [n stringValue];
}

-(NSString*)pow:(NSString*)content andExp:(double)y
{
    NSNumber* n = [[NSNumber alloc]initWithDouble:pow([content doubleValue],y)];
    return [n stringValue];
}

-(NSString*)fac:(NSString*)content
{
    NSMutableString* result = [[NSMutableString alloc]init];
    int f[16]={0};
    int n,i,j,s,up;
    n = [content intValue];
    for(i=2,f[0]=1;i<=n;i++)
    {
        for(j=up=0;j<16;j++)
        {
            s=f[j]*i+up;
            f[j]=s%10;
            up=s/10;
        }
    }
    for(i=16-1;f[i]==0;i--);
    for(;i>=0;i--)
        [result appendString:[[[NSNumber alloc]initWithInt:f[i]] stringValue]];
    return result;
}


-(NSMutableString*)screen
{
    if(!_screen)
    {
        _screen = [[NSMutableString alloc]init];
    }
    return _screen;
}
-(void)clearScreen
{
    self.screen = nil;
}
@end
