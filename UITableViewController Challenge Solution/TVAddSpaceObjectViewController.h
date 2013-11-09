//
//  TVAddSpaceObjectViewController.h
//  UITableViewController Challenge Solution
//
//  Created by Seema Mehta on 30/10/13.
//  Copyright (c) 2013 iDoodle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TVSpaceObject.h"

@protocol TVAddSpaceObjectViewControllerDelegate <NSObject>

@required

-(void)addSpaceObject:(TVSpaceObject *)spaceObject;

-(void)didCancel;

@end

@interface TVAddSpaceObjectViewController : UIViewController

@property (weak, nonatomic) id <TVAddSpaceObjectViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *moonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestFactTextField;

- (IBAction)cancelButtonPressed:(UIButton *)sender;

- (IBAction)addButtonPressed:(UIButton *)sender;

@end
