//
//  Calculator.m
//  calculator1
//
//  Created by ZH on 17-11-5.
//  Copyright (c) 2017年 ZH. All rights reserved.
//

#import "Calculator.h"
#import "calculate.h"
//#include "MyException.h"

@implementation Calculator

-(NSString*)computerResult
{
    calculate* cale = [[calculate alloc]init];
    NSMutableString* str = self.disp;//[[NSMutableString alloc]init];
    if([str length] == 0)
        return nil;
    //[str appendString:@"10/6*7+15-8"];

   // if([str length] == 1 && ![cal IsOptr:str])
     //   return str;

    [str appendString:@"#"];
    cale.str = str;
    NSLog(@"str = %@",cale.str);
    NSMutableArray* all_opnd = [cale opnd];
    
    NSMutableArray* all_optr = [cale optr];
    if([all_opnd count]==1 && [all_optr count] == 1)//20.3#
    {
        [str deleteCharactersInRange:NSMakeRange([str length] - 1, 1)];
        return str;
    }

    NSMutableArray* OPTR = [[NSMutableArray alloc]init];

    [cale push:OPTR withChar:@"#"];

    NSMutableString* c = [[NSMutableString alloc]init ];
    NSMutableString* c_esp = [[NSMutableString alloc]init ];
    double a,b,result=0.0;
    int j = -1;
    BOOL preIsOptr = NO;

    @try
    {
    
        for(int i = 0;i < [str length];i++)
        {NSLog(@"r2 = %@",all_opnd);
            c = [[str substringWithRange:NSMakeRange(i, 1)] mutableCopy];
            if(![cale IsOptr:c] )
            {
                if(!preIsOptr)
                    j++;
                preIsOptr = YES;
            }
            else
            {
                preIsOptr = NO;
                while(1)
                {
                    if([[cale comparePri:[cale getTop:OPTR] with:c]  isEqual: @"<"])
                    {
                        [cale push:OPTR withChar:c];break;
                    }else
                        if([[cale comparePri:[cale getTop:OPTR] with:c]  isEqual: @">"])
                        {
                        
                            c_esp = [cale pop:OPTR];
                            a = [[all_opnd objectAtIndex:j-1] doubleValue];
                            b = [[all_opnd objectAtIndex:j] doubleValue];
                            [all_opnd removeObjectAtIndex:j];
                            [all_opnd removeObjectAtIndex:j-1];
                        //@try{
                                result = [[cale calculate:a and:b withOp:c_esp] doubleValue];
                        //}@catch(MyException *e){
                         //   NSLog(@"Error");
                           // exit(-1);
                       // }
                            [all_opnd insertObject:@(result) atIndex:j-1];
                            j--;
                            NSLog(@"result = %@",@(result));
                            NSLog(@"r = %@",all_opnd);
                        }else
                            if([[cale comparePri:[cale getTop:OPTR] with:c]  isEqual: @"="])
                            {
                                [cale pop:OPTR];break;
                            }
                    NSLog(@"%@",all_opnd);
                }
            }
        }
    }@catch(NSException *e)
    {
        return @"Error";
    }
    //NSLog(@"all = %@",[all_opnd objectAtIndex:0]);
    //[str deleteCharactersInRange:NSMakeRange([str length] - 1, 1) ];
    return [[all_opnd objectAtIndex:0] stringValue];
}
-(NSMutableString*)disp
{
    if(!_disp)
    {
        _disp = [[NSMutableString alloc]init];
    }
    return _disp;
}
-(void)clearDisp
{
    self.disp = nil;
}
-(void) delNumber
{
    long len = self.disp.length - 1;
    if(len > 0)
    {
        [self.disp deleteCharactersInRange:NSMakeRange(len, 1)];
    }
}
@end
