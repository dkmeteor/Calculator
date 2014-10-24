//
//  ViewController.m
//  Calculator
//
//  Created by DK on 10/22/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "ViewController.h"
#import "ButtonFactory.h"
#import "Calculator.h"
@interface ViewController ()
@property int buttonWidth;
@property int buttonHeight;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property Calculator *calculator;
@end

@implementation ViewController

NSArray *buttonsText;
static const int BUTTON_HORIZON_DIVIDER = 16;
static const int BUTTON_VERTIAL_DIVIDER = 36;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.calculator=[[Calculator alloc] init];
    ButtonFactory *factory=[ButtonFactory getInstance];
    buttonsText= [[NSArray alloc] initWithObjects:@"C",@"√",@"±",@"%",@"7",@"8",@"9",@"÷",@"4",@"5",@"6",@"×",@"1",@"2",@"3",@"-",@"0",@".",@"=",@"+", nil];
    
    self.buttonWidth=(self.view.frame.size.width - BUTTON_HORIZON_DIVIDER * 5 ) / 4;
    self.buttonHeight = 60;
    
    for(int i = 0 ;i < 20;i++ )
    {
        UIButton *button=nil;
        NSString *text= [buttonsText objectAtIndex:i];

        if(i==0)
        {
            button =[factory createButton:text  buttontype:red];
        }
        else if(i < 4 || i % 4 == 3)
        {
            button =[factory createButton:text  buttontype:grey];
        }
        else
        {
            button =[factory createButton:text  buttontype:black];
        }
        [self addButtonToScreen:button atIndex:i];
    }
    
}

- (void) viewWillAppear:(BOOL)animated
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) addButtonToScreen :(UIButton *) button atIndex: (int) index
{
    int top = BUTTON_VERTIAL_DIVIDER+(index / 4) * (self.buttonHeight + BUTTON_VERTIAL_DIVIDER);
    int left = BUTTON_HORIZON_DIVIDER+(index % 4) * (self.buttonWidth + BUTTON_HORIZON_DIVIDER);
    button.frame = CGRectMake(left, top, self.buttonWidth, self.buttonHeight);
    UIView *container = [self.view.subviews objectAtIndex:1];
    [button addTarget:self action:@selector(click:)
     forControlEvents:UIControlEventTouchUpInside];
    [container addSubview:button];
}

- (void)click:(UIButton *)sender {
    NSString *text =sender.titleLabel.text;
    NSString *result = [self.calculator pushNext:text];
    self.outputLabel.text = [Calculator formatNumber:result];
}

@end
