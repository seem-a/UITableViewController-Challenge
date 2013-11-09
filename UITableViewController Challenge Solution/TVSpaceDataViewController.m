//
//  TVSpaceDataViewController.m
//  UITableViewController Challenge Solution
//
//  Created by Seema Mehta on 27/10/13.
//  Copyright (c) 2013 iDoodle. All rights reserved.
//

#import "TVSpaceDataViewController.h"

@interface TVSpaceDataViewController ()

@end

@implementation TVSpaceDataViewController

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
    
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    //alternatively hook up delegate and datasource on the storyboard in the connections inspector
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Nickname:";
            cell.detailTextLabel.text = self.spaceObject.nickname;
            break;
            
        case 1:
            cell.textLabel.text = @"Gravity:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.gravitationalForce];
            break;
            
        case 2:
            cell.textLabel.text = @"Diameter:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.diameter];
            break;
            
        case 3:
            cell.textLabel.text = @"Length of year (days):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.yearLength];
            break;
            
        case 4:
            cell.textLabel.text = @"Length of day (hours):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.dayLength];
            break;
            
        case 5:
            cell.textLabel.text = @"Temperature:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.temperature];
            break;
            
        case 6:
            cell.textLabel.text = @"Number of moons:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", self.spaceObject.numberOfMoons];
            break;
            
        case 7:
            cell.textLabel.text = @"Interesting fact:";
            cell.detailTextLabel.text = self.spaceObject.interestFact;
            break;
            
        default:
            break;
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}


@end
