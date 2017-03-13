//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by virat_singh on 3/12/17.
//  Copyright © 2017 viratsingh. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipSelector;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSaveClicked:(UIBarButtonItem *)sender {
    long tipIndex = self.defaultTipSelector.selectedSegmentIndex;
    
    NSLog(@"Default tip is: %ld", (long)tipIndex);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:tipIndex forKey:@"default_tip_index"];
    [defaults synchronize];
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
