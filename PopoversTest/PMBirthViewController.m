//
//  PMBirthViewController.m
//  PopoversTest
//
//  Created by Pavel on 30.01.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import "PMBirthViewController.h"
#import "ViewController.h"


@interface PMBirthViewController ()

@end

@implementation PMBirthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *buttonDone = [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleDone target: self action: @selector(actionBirthDone:)];
    
    [self.navigationItem setRightBarButtonItem: buttonDone];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void) actionBirthDone: (UIBarButtonItem *) sender {
    
    
    
    [self dismissViewControllerAnimated: YES completion: nil];
}

- (IBAction) actionValueChanged: (UIDatePicker *) sender {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"dd MMMM yyyy"];

    NSString *itemToPassBack = [dateFormatter stringFromDate: sender.date];
    [self.delegate birthViewController: self didChangeDatePiker: itemToPassBack];
}

@end
