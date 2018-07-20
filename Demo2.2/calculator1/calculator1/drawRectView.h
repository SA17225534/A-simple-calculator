//
//  drawRectView.h
//  calculator1
//
//  Created by ZH on 17-11-11.
//  Copyright (c) 2017年 ZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface drawRectView : UIView
@property (strong,nonatomic) UIColor* color;

-(void)drawRect:(CGRect)rect;
@end
