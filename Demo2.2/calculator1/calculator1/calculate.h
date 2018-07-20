//
//  calculate.h
//  calculate_model
//
//  Created by ZH on 17-11-4.
//  Copyright (c) 2017年 ZH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calculate : NSObject
@property(strong,nonatomic) NSMutableString* str;
-(NSNumber*)calculate:(double) a and:(double) b withOp:(NSString*)ch;
-(NSMutableArray*)optr;
-(NSMutableArray*)opnd;
-(NSMutableString*)pop:(NSMutableArray*)arr_op;// withChar:(NSString*)ch;
-(void)push:(NSMutableArray*)arr_op withChar:(NSString*)ch;
-(NSString*)comparePri:(NSString*)ch1 with:(NSString*)ch2;
-(BOOL)IsOptr:(NSMutableString*)ch;
-(NSMutableString*)getTop:(NSMutableArray*)arr_op;
@end
