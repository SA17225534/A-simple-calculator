//
//  drawRectView.m
//  calculator1
//
//  Created by ZH on 17-11-11.
//  Copyright (c) 2017年 ZH. All rights reserved.
//

#import "drawRectView.h"

@implementation drawRectView

-(UIColor*)color
{
    if(!_color)
    {
        _color = [UIColor grayColor];
    }
    return _color;
}


-(void)drawRect:(CGRect)rect
{
    UIBezierPath* path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(30,330)];
    [path addLineToPoint:CGPointMake(350, 330)];
    [path addLineToPoint:CGPointMake(30, 420)];
    [path moveToPoint:CGPointMake(350,420)];
    [path addLineToPoint:CGPointMake(350, 330)];
    [path addLineToPoint:CGPointMake(30, 420)];
    [path closePath];
    [self.color setFill];
    [self.color setStroke];
    [path fill];
    [path stroke];
    [self layoutIfNeeded];
}
@end
