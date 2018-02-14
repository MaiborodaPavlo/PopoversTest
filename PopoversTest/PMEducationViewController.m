//
//  PMEducationViewController.m
//  PopoversTest
//
//  Created by Pavel on 31.01.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import "PMEducationViewController.h"

@interface PMEducationViewController () <UITableViewDelegate>

@property (strong, nonatomic) UITableViewCell *checkedCell;

@end

@implementation PMEducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UIBarButtonItem *buttonDone = [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleDone target: self action: @selector(actionEducationDone:)];
    
    [self.navigationItem setRightBarButtonItem: buttonDone];
    
    if (![self.education isEqualToString: @""]) {
        
        for (UITableViewCell *cell in self.cellsCollection) {
            if ([cell.textLabel.text isEqualToString: self.education]) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                self.checkedCell = cell;
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void) actionEducationDone: (UIBarButtonItem *) sender {
    
    [self dismissViewControllerAnimated: YES completion: nil];
}

#pragma mark - UITableViewDelegate

- (void) tableView: (UITableView *) tableView didHighlightRowAtIndexPath: (NSIndexPath *) indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
    
    if (self.checkedCell) {
        self.checkedCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.checkedCell = cell;
    
    NSString *educationString = cell.textLabel.text;
    self.education = educationString;
    
    [self.delegate educationViewController: self didChangeCheckedCell: educationString];
}

@end
