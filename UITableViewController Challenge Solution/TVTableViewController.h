//
//  TVTableViewController.h
//  UITableViewController Challenge Solution
//
//  Created by Seema Mehta on 21/10/13.
//  Copyright (c) 2013 iDoodle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TVAddSpaceObjectViewController.h"

@interface TVTableViewController : UITableViewController <TVAddSpaceObjectViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;

@property (strong, nonatomic) NSMutableArray *addedSpaceObjects;

@end
