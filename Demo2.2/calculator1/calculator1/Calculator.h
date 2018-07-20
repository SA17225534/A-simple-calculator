//
//  Calculator.h
//  calculator1
//
//  Created by ZH on 17-11-5.
//  Copyright (c) 2017年 ZH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
@property(strong,nonatomic)NSMutableString* disp;
-(void)delNumber;
-(NSString*)computerResult;
-(void)clearDisp;
@end
