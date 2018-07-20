//
//  SecondViewController.m
//  calculator1
//
//  Created by ZH on 17-11-7.
//  Copyright (c) 2017年 ZH. All rights reserved.
//

#import "SecondViewController.h"
#import "advanceCalculator.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtdisplay;
@property (weak, nonatomic) IBOutlet UIButton *btnleft;
@property (weak, nonatomic) IBOutlet UIButton *btnright;
@property (weak, nonatomic) IBOutlet UIButton *btne;
@property (weak, nonatomic) IBOutlet UIButton *btnpai;
@property (weak, nonatomic) IBOutlet UIButton *btnabs;
@property (weak, nonatomic) IBOutlet UIButton *btnsqr2;
@property (weak, nonatomic) IBOutlet UIButton *btnsqr3;
@property (weak, nonatomic) IBOutlet UIButton *btnsqr4;
@property (weak, nonatomic) IBOutlet UIButton *btnrec;
@property (weak, nonatomic) IBOutlet UIButton *btnexp2;
@property (weak, nonatomic) IBOutlet UIButton *btnexp3;
@property (weak, nonatomic) IBOutlet UIButton *btnfac;
@property (weak, nonatomic) IBOutlet UIButton *btnsin;
@property (weak, nonatomic) IBOutlet UIButton *btncos;
@property (weak, nonatomic) IBOutlet UIButton *btntan;
@property (weak, nonatomic) IBOutlet UIButton *btnln;
@property (weak, nonatomic) IBOutlet UIButton *btnasin;
@property (weak, nonatomic) IBOutlet UIButton *btnacos;
@property (weak, nonatomic) IBOutlet UIButton *btnatan;
@property (weak, nonatomic) IBOutlet UIButton *btnlg;


@end

@implementation SecondViewController

- (IBAction)inputKey:(UIButton *)sender {
    if(sender.tag < 4)
    {
        NSMutableString* str = [NSMutableString stringWithString:self.cal.screen];//self.txtdisplay.text];
        if([[[sender titleLabel]text] isEqualToString:@"e"])
        {
            [self.cal.disp appendString:@"2.7182818"];
        }else if ([[[sender titleLabel]text]isEqualToString:@"∏"])
        {
            [self.cal.disp appendString:@"3.1415926"];
        }else
        {
            [self.cal.disp appendString:[[sender titleLabel]text]];
        }
        [str appendString:[[sender titleLabel]text]];
        self.cal.screen = str;
        if([str length] >= 30)
        {
            NSMutableString* temp = [str mutableCopy];
            [temp deleteCharactersInRange:NSMakeRange(0, [temp length] - 29)];
            self.txtdisplay.text = temp;
        }else
            self.txtdisplay.text = str;
        //self.txtdisplay.text = str;
  
    }else
    {
        NSString* result;
        if(sender.tag == 4)
        {
            result = [self.cal abs:[self.cal computerResult]];
        }else   if(sender.tag == 5)
        {
            result = [self.cal sqrt:[self.cal computerResult]];

        }else if (sender.tag < 11)
        {
            if(sender.tag == 6)
                result = [self.cal pow:[self.cal computerResult] andExp:1.0/3];
            else if (sender.tag == 7)
                result = [self.cal pow:[self.cal computerResult] andExp:0.25];
            else if (sender.tag == 8)
                result = [self.cal pow:[self.cal computerResult] andExp:-1];
            else if (sender.tag == 9)
                result = [self.cal pow:[self.cal computerResult] andExp:2];
            else
                result = [self.cal pow:[self.cal computerResult] andExp:3];
        }else if (sender.tag == 11)
            result = [self.cal fac:[self.cal computerResult]];
        else if (sender.tag == 12)
            result = [self.cal sin:[self.cal computerResult]];
        else if (sender.tag == 13)
            result = [self.cal cos:[self.cal computerResult]];
        else if (sender.tag == 14)
            result = [self.cal tan:[self.cal computerResult]];
        else if (sender.tag == 15)
            result = [self.cal ln:[self.cal computerResult]];
        else if (sender.tag == 16)
            result = [self.cal asin:[self.cal computerResult]];
        else if (sender.tag == 17)
            result = [self.cal sin:[self.cal computerResult]];
        else if (sender.tag == 18)
            result = [self.cal atan:[self.cal computerResult]];
        else if (sender.tag == 19)
            result = [self.cal lg:[self.cal computerResult]];
        self.cal.disp = [NSMutableString stringWithString:result];
        self.cal.screen = [NSMutableString stringWithString:result];//self.cal.disp;
        self.txtdisplay.text = self.cal.screen;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
     NSMutableString *str = [NSMutableString stringWithString:self.cal.screen];
    if([str length] >= 30)
    {
        NSMutableString* temp = [str mutableCopy];
        [temp deleteCharactersInRange:NSMakeRange(0, [temp length] - 29)];
        self.txtdisplay.text = temp;
    }else
        self.txtdisplay.text = str;
    //self.txtdisplay.text = self.cal.screen;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
