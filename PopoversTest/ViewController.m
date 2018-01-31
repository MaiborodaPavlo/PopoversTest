//
//  ViewController.m
//  PopoversTest
//
//  Created by Pavel on 30.01.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import "ViewController.h"
#import "PMInfoViewController.h"
#import "PMBirthViewController.h"

@interface ViewController () <UIPopoverPresentationControllerDelegate, UITextFieldDelegate, PMBirthViewControllerDelegate>

@property (strong, nonatomic) UIPopoverPresentationController *popover;


@end

typedef enum {
    PMTextFieldFirstName = 1,
    PMTextFieldLastName,
    PMTextFieldBirth,
    PMTextFieldEducation
    
} PMTextField;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.nameField becomeFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction) actionGetInfo: (UIBarButtonItem *) sender {
    
    PMInfoViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier: @"PMInfoViewController"];

    // init popover
    vc.preferredContentSize = CGSizeMake(300, 300);
    vc.modalPresentationStyle = UIModalPresentationPopover;
    self.popover = vc.popoverPresentationController;
    self.popover.delegate = self;
    self.popover.sourceView = self.view;
    self.popover.barButtonItem = sender;
    
    [self presentViewController: vc animated: YES completion: nil];

}

#pragma mark - UIPopoverPresentationControllerDelegate

- (void) popoverPresentationControllerDidDismissPopover: (UIPopoverPresentationController *) popoverPresentationController {
    
    self.popover = nil;
}

- (UIModalPresentationStyle) adaptivePresentationStyleForPresentationController: (UIPresentationController *) controller {
    
    return UIModalPresentationNone;
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldBeginEditing: (UITextField *) textField {
    
    if ([textField isEqual: self.birthField]) {

        PMBirthViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier: @"PMBirthViewController"];
        vc.delegate = self;
        
        // init popover
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: vc];
        
        vc.preferredContentSize = CGSizeMake(400, 200);
        nav.modalPresentationStyle = UIModalPresentationPopover;
        self.popover = nav.popoverPresentationController;
        self.popover.delegate = self;
        self.popover.sourceView = self.view;

        self.popover.sourceRect = CGRectMake(textField.frame.origin.x, textField.frame.origin.y + 140, CGRectGetWidth(textField.frame), CGRectGetHeight(textField.frame));
        
        if (textField.text) {
            vc.date = textField.text;
        }
        
        [self presentViewController: nav animated: YES completion: nil];

        return NO;
    } else if (textField.tag == PMTextFieldEducation) {
        
        return NO;
    } else {
        
        return YES;
    }
}

- (BOOL) textFieldShouldReturn: (UITextField *) textField {
    
    if ([textField isEqual: self.nameField]) {
        [self.lastNameField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

#pragma mark - PMBirthViewControllerDelegate

- (void) birthViewController: (PMBirthViewController *) controller didChangeDatePiker: (NSString *) itemDate {
    
    self.birthField.text = itemDate;
}

@end
