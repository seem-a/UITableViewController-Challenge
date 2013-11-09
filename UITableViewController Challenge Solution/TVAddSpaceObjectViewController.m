//
//  TVAddSpaceObjectViewController.m
//  UITableViewController Challenge Solution
//
//  Created by Seema Mehta on 30/10/13.
//  Copyright (c) 2013 iDoodle. All rights reserved.
//

#import "TVAddSpaceObjectViewController.h"

@interface TVAddSpaceObjectViewController ()

@end

@implementation TVAddSpaceObjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"Orion.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    
    [self.delegate didCancel];
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    
    [self.delegate addSpaceObject:[self returnSpaceObject]];
}

-(TVSpaceObject *)returnSpaceObject
{
    TVSpaceObject *spaceObject = [[TVSpaceObject alloc] init];
    spaceObject.name = self.nameTextField.text;
    spaceObject.nickname = self.nicknameTextField.text;
    spaceObject.diameter = [self.diameterTextField.text floatValue];
    spaceObject.yearLength = [self.temperatureTextField.text floatValue];
    spaceObject.numberOfMoons = [self.moonsTextField.text intValue];
    spaceObject.interestFact = self.interestFactTextField.text;
    spaceObject.spaceObjectImage = [UIImage imageNamed:@"EinsteinRing.jpg"];
    
    return spaceObject;
}

@end
