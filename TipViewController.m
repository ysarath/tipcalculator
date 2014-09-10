//
//  TipViewController.m
//  tipcalculator
//
//  Created by Sarath Yalamanchili on 9/8/14.
//  Copyright (c) 2014 Sarath. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (strong, nonatomic) IBOutlet UIView *tipCalculatorView;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;



@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"Inside Tip Calculator");
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
     [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onSettingsButton)];
    
    [self defaultValues];

     [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTap:(id)sender {
    NSLog(@"Inside onTap");
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)defaultValues{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"tipDefault"];
    NSLog(@"Loading Default Value from NSDefault %i",intValue);
    self.tipControl.selectedSegmentIndex = intValue;
}

- (void)updateValues{
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1),@(0.15),@(0.2)];
    float tipAmount = billAmount*[tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    
    float totalAmount = tipAmount+billAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
}

- (void) onSettingsButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    [self defaultValues];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}


@end
