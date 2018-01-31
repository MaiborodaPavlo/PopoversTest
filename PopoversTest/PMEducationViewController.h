//
//  PMEducationViewController.h
//  PopoversTest
//
//  Created by Pavel on 31.01.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PMEducationViewController;

@protocol PMEducationViewControllerDelegate

- (void) educationViewController: (PMEducationViewController *) controller didChangeCheckedCell: (NSString *) item;

@end

@interface PMEducationViewController : UITableViewController

@property (weak, nonatomic) id <PMEducationViewControllerDelegate> delegate;

@property (strong, nonatomic) NSString *education;

@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *cellsCollection;

@end
