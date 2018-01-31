//
//  ViewController.h
//  PopoversTest
//
//  Created by Pavel on 30.01.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *birthField;
@property (weak, nonatomic) IBOutlet UITextField *educationField;

- (IBAction) actionGetInfo: (UIBarButtonItem *) sender;

@end

