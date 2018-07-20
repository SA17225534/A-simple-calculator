//
//  HealthViewController.m
//  calculator1
//
//  Created by ZH on 17-11-9.
//  Copyright (c) 2017年 ZH. All rights reserved.
//

#import "HealthViewController.h"
#import "Calculator+Health.h"
#import "drawRectView.h"

@interface HealthViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtHeight;
@property (weak, nonatomic) IBOutlet UITextField *txtWeight;
@property (weak, nonatomic) IBOutlet UILabel *labAdv;
@property (weak, nonatomic) IBOutlet UILabel *labScore;
@property (weak, nonatomic) IBOutlet UIButton *btnCal;

@property (strong,nonatomic) Calculator *cal;
@property (strong,nonatomic) drawRectView* myView;
@end

@implementation HealthViewController
-(void)viewWillAppear:(BOOL)animated
{
    [self.btnCal.layer setMasksToBounds:YES];
    [self.btnCal.layer setCornerRadius:12];
    [self.btnCal.layer setBorderWidth:1];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.txtHeight || textField == self.txtWeight)
    {
        [textField resignFirstResponder];
    }
    return YES;
}

- (IBAction)computeScore:(UIButton *)sender {
    NSString* score = [self.cal computeHealthWithHeight: self.txtHeight.text andWeight:self.txtWeight.text];
    if([score floatValue] < 19)
    {
        self.labAdv.text = @"体重过轻，需要增加营养。";
        self.myView.color = [UIColor whiteColor];
    }
    else if([score floatValue] < 25)
    {
        self.labAdv.text = @"体重正常，继续保持。";
        self.myView.color = [UIColor greenColor];
    }
    else if([score floatValue] < 30)
    {
        self.labAdv.text = @"过重，需要加强锻炼。";
        self.myView.color = [UIColor orangeColor];
    }
    else if([score floatValue] >= 30)
    {
        self.labAdv.text = @"严重肥胖，建议去医院检查。";
        self.myView.color = [UIColor redColor];
    }
    self.labScore.text = score;
    [self.myView setNeedsDisplay];
}

-(drawRectView*)myView
{
    if(!_myView)
    {
        _myView = [[drawRectView alloc]initWithFrame:CGRectMake(0, 0, 400,700)];
        _myView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _myView;

}
-(Calculator*)cal
{
    if(!_cal)
        _cal = [[Calculator alloc]init];
    return _cal;
}
- (void)viewDidLoad {
    self.cal = [[Calculator alloc]init];
    [self.view addSubview:self.myView];
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
