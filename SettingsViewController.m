//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Sarath Yalamanchili on 9/9/14.
//  Copyright (c) 2014 Sarath. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveData;
@property (strong, nonatomic) IBOutlet UIView *tipSettingsView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultValue;

-(void) loadDefaultvalues;

@end

@implementation SettingsViewController

- (IBAction)handleSaveClick:(id)sender {
    NSLog(@"Inside Save Button");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultValue.selectedSegmentIndex forKey:@"tipDefault"];
    [defaults synchronize];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultValue.selectedSegmentIndex forKey:@"tipDefault"];
    [defaults synchronize];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // NSLog(@"Inside SettingViewController- viewDidLoad");
   // NSLog(@"Inside SettingViewController- viewDidLoad %i",self.defaultValue.selectedSegmentIndex);
    [self loadDefaultvalues];
    //    NSLog(@"Inside SettingViewController- viewDidLoad %i",self.defaultValue.selectedSegmentIndex);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)updateValues{
    NSArray *tipValues = @[@(0.1),@(0.15),@(0.2)];
    float defaultTipPercent = [tipValues[self.defaultValue.selectedSegmentIndex] floatValue];
}


-(void) loadDefaultvalues{
    NSLog(@"Loading Default Values");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"tipDefault"];
    NSLog(@"Loading Default Value from NSDefault %i",intValue);
    self.defaultValue.selectedSegmentIndex = intValue;
}

@end
