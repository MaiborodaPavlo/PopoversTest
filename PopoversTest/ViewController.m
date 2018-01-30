//
//  ViewController.m
//  PopoversTest
//
//  Created by Pavel on 30.01.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import "ViewController.h"
#import "PMInfoViewController.h"

@interface ViewController () <UIPopoverPresentationControllerDelegate>

@property (strong, nonatomic) UIPopoverPresentationController *popover;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction) actionGetInfo: (UIBarButtonItem *) sender {
    
    PMInfoViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier: @"PMInfoViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        // init popover
        vc.preferredContentSize = CGSizeMake(300, 300);
        vc.modalPresentationStyle = UIModalPresentationPopover;
        self.popover = vc.popoverPresentationController;
        self.popover.delegate = self;
        self.popover.sourceView = self.view;
        self.popover.barButtonItem = sender;
        
        [self presentViewController: vc animated:YES completion:nil];
    }
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    
    self.popover = nil;
}

- (UIModalPresentationStyle) adaptivePresentationStyleForPresentationController: (UIPresentationController *) controller {
    
    return UIModalPresentationNone;
}

@end
