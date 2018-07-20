//
//  ViewController.m
//  calculator1
//
//  Created by ZH on 17-11-5.
//  Copyright (c) 2017年 ZH. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "advanceCalculator.h"
#import "SecondViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtdisplay;
@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;
@property (weak, nonatomic) IBOutlet UIButton *btndot;
@property (weak, nonatomic) IBOutlet UIButton *btnadd;
@property (weak, nonatomic) IBOutlet UIButton *btnsub;
@property (weak, nonatomic) IBOutlet UIButton *btnmul;
@property (weak, nonatomic) IBOutlet UIButton *btndiv;
@property (weak, nonatomic) IBOutlet UIButton *btnper;

@property (strong,nonatomic) advanceCalculator *clr;

@end

@implementation ViewController
- (IBAction)inputNumber:(UIButton *)sender {
    NSLog(@"ccccccccccc");
    NSMutableString *str = [NSMutableString stringWithString:self.clr.screen];//self.txtdisplay.text];
    if([[[sender titleLabel]text]isEqualToString:@"×"])
    {
        [self.clr.disp appendString:@"*"];
    }else if ([[[sender titleLabel]text]isEqualToString:@"÷"])
    {
        [self.clr.disp appendString:@"/"];
    }else
    {
        [self.clr.disp appendString:[[sender titleLabel]text] ];
    }
    [str appendString:[[sender titleLabel]text]];
    self.clr.screen = str;
    if(str == self.clr.screen)
        NSLog(@"yiyang");
    //NSLog(@"disp length = %lu,screen2222222 length = %lu",self.clr.disp.length,self.clr.screen.length);
    if([str length] >= 30)
    {
        NSMutableString* temp = [str mutableCopy];
        [temp deleteCharactersInRange:NSMakeRange(0, [temp length] - 29)];
        self.txtdisplay.text = temp;
    }else
        self.txtdisplay.text = str;
//    NSLog(@"disp length = %lu,screen length = %lu",self.clr.disp.length,self.clr.screen.length);
}
- (IBAction)clear:(UIButton *)sender {
    self.txtdisplay.text = nil;
    [self.clr clearDisp];
    [self.clr clearScreen];
}

- (IBAction)delNumber:(UIButton *)sender {
    long len = self.clr.disp.length - 1;
    NSLog(@"disp length = %lu,screen length = %lu",len + 1,self.clr.screen.length);
    NSString* temp = [[NSString alloc]init];
    if(len >= 0)
    {
        [self.clr.disp deleteCharactersInRange:NSMakeRange(len, 1)];
        [self.clr.screen deleteCharactersInRange:NSMakeRange(len, 1)];
        
        temp = self.clr.disp;
        temp = [temp stringByReplacingOccurrencesOfString:@"/"withString:@"÷"];
        temp = [temp stringByReplacingOccurrencesOfString:@"*"withString:@"×"];
        if([temp length] >= 30)
        {
            NSMutableString* temp2 = [temp mutableCopy];
            [temp2 deleteCharactersInRange:NSMakeRange(0, [temp2 length] - 29)];
            self.txtdisplay.text = temp2;
        }else
            self.txtdisplay.text = temp;
        //self.txtdisplay.text = temp;
    }
}

- (IBAction)compute:(UIButton *)sender {
    self.txtdisplay.text = self.clr.computerResult;
    self.clr.disp = nil;
    [self.clr.disp appendString:self.txtdisplay.text];
    self.clr.screen = nil;
    [self.clr.screen appendString:self.txtdisplay.text];
}

-(advanceCalculator*)clr
{
    if(!_clr)
        _clr = [[advanceCalculator alloc]init];
    return _clr;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"SecondScence"])
    {
        if([segue.destinationViewController isKindOfClass:[SecondViewController class]])
        {
            SecondViewController* svc = (SecondViewController*)segue.destinationViewController;
            svc.cal = self.clr;
            if(svc.cal == self.clr)
            {
                NSLog(@"equal");
            }
        }
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    NSMutableString *str = [NSMutableString stringWithString:self.clr.screen];
    if([str length] >= 30)
    {
        NSMutableString* temp = [str mutableCopy];
        [temp deleteCharactersInRange:NSMakeRange(0, [temp length] - 29)];
        self.txtdisplay.text = temp;
    }else
        self.txtdisplay.text = str;
    //self.txtdisplay.text = self.clr.screen;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clr = [[advanceCalculator alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
