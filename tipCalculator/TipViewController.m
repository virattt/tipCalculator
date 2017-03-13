//
//  ViewController.m
//  tipCalculator
//
//  Created by virat_singh on 3/7/17.
//  Copyright © 2017 viratsingh. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewWillAppear:(BOOL)animated {
    [self setDefaultTip];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    // Get bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    // Compute the tip and total
    NSArray *tipValues = @[@(0.15), @(0.20), @(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    // Update the UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)setDefaultTip {
    // Load default tip
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long defaultTip = [defaults integerForKey:@"default_tip_index"];
    
    self.tipControl.selectedSegmentIndex = defaultTip;
}


@end
