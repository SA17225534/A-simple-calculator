//
//  calculate.m
//  calculate_model
//
//  Created by ZH on 17-11-4.
//  Copyright (c) 2017年 ZH. All rights reserved.
//

#import "calculate.h"
//#import "MyException.h"

@implementation calculate
@synthesize str = _str;
-(void)setStr:(NSMutableString *)str
{
    _str = str;
}
-(NSMutableString*)str
{
    return _str;
}

-(NSMutableArray*)optr
{
    
    NSArray *arr = [[self.str stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"1234567890."]]componentsSeparatedByCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"1234567890."]];;
    //NSLog(@"%@",arr);
    NSMutableArray* arr_tr = [arr mutableCopy];
    return arr_tr;
}
-(NSMutableArray*)opnd
{
    NSArray *arr = [[_str stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"+-*/^%()#"] ]componentsSeparatedByCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"+-*/^%()#"]];
    NSMutableArray* arr_nd = [arr mutableCopy];
    [arr_nd removeObject:@""];
    return arr_nd;
}
-(NSMutableString*)pop:(NSMutableArray*)arr_op// withChar:(NSString*)ch
{
    NSUInteger count = arr_op.count;
    // if(count>=1)
    // {
    NSMutableString* ch =[[NSMutableString  alloc]init];
    ch = [arr_op objectAtIndex:count-1];
    [arr_op removeObjectAtIndex:count-1];
    return ch;
    //}
    //return nil;
}

-(void)push:(NSMutableArray*)arr_op withChar:(NSString*)ch
{
    NSUInteger count = arr_op.count;
    [arr_op insertObject:ch atIndex:count];
    //NSLog(@"%@",arr_op);
}

-(NSString*)comparePri:(NSString*)ch1 with:(NSString*)ch2
{
    NSUInteger c1 = 10,c2 = 10;
    if([ch1  isEqual: @"#"])
        c1 = 0;
    else
        if([ch1  isEqual: @"("])
            c1 = 1;
        else
            if([ch1  isEqual: @"^"])
                c1 = 7;
            else
                if([ch1  isEqual: @"*"] || [ch1  isEqual: @"/"] || [ch1  isEqual: @"%"])
                    c1 = 5;
                else
                    if ([ch1  isEqual: @"+"] || [ch1  isEqual: @"-"])
                        c1 = 3;
                    else
                        if ([ch1  isEqual: @")"])
                            c1 = 8;
    if([ch2  isEqual: @"#"])
        c2 = 0;
    else
        if([ch2  isEqual: @"("])
            c2 = 8;
        else
            if([ch2  isEqual: @"^"])
                c2 = 6;
            else
                if([ch2  isEqual: @"*"] || [ch2  isEqual: @"/"] || [ch2  isEqual: @"%"])
                    c2 = 4;
                else
                    if ([ch2  isEqual: @"+"] || [ch2  isEqual: @"-"])
                        c2 = 2;
                    else
                        if ([ch2  isEqual: @")"])
                            c2 = 1;
    //NSLog(@"%@ %@ %lu %lu",ch1,ch2,(unsigned long)c1,(unsigned long)c2);
    if(c1 == c2)
        return @"=";
    else
        if (c1 > c2)
            return @">";
        else
            return @"<";
    
}
-(NSMutableString*)getTop:(NSMutableArray*)arr_op
{
    NSUInteger count = arr_op.count;
    if(count>=1)
    {
        NSMutableString* ch =[[NSMutableString  alloc]init];
        ch = [arr_op objectAtIndex:count-1];
        return ch;
    }
    return nil;
}


-(BOOL)IsOptr:(NSMutableString*)ch
{
    if([ch  isEqual: @"+"] || [ch  isEqual: @"-"] || [ch  isEqual: @"*"] || [ch  isEqual: @"/"] || [ch  isEqual: @"%"] || [ch  isEqual: @"^"] || [ch  isEqual: @"#"] || [ch  isEqual: @"("] || [ch  isEqual: @")"])
        return YES;
    else
        return NO;
}


-(NSNumber*)calculate:(double) a and:(double) b withOp:(NSString*)ch
{
    //MyException *myException=[[MyException alloc] initWithName :@"fatal error" reason : @"除数为0" userInfo : nil];
    const char c = *[ch UTF8String];
    double result = 0.0;
    switch(c)
    {
        case '+':{result = a+b;break;}
        case '-':{result =  a-b;break;}
        case '*':{result = a*b;break;}
        case '/':{
            //if(b == 0)
            //@throw myException;
            result =  a/b;
            break;
        }
        case '%':{result = fmod(a,b);break;}// (int)a%(int)b;break;}
        case '^':{
            if(b == 0)
                return @(1);
            result = a;
            for(int i = 1;i<b;i++)
                result *= a;
            break;
        }
    }
    //NSNumber *num = [NSNumber numberWithDouble:result];
    //NSLog(@"result = %lf,@ = %@,num = %lf",fmod(a,b),@(result),[[NSNumber numberWithFloat:result]doubleValue]);
    return @(result);//num;
}

@end

