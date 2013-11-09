//
//  TVSpaceDataViewController.h
//  UITableViewController Challenge Solution
//
//  Created by Seema Mehta on 27/10/13.
//  Copyright (c) 2013 iDoodle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TVSpaceObject.h"

@interface TVSpaceDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, atomic) TVSpaceObject *spaceObject;

@end
