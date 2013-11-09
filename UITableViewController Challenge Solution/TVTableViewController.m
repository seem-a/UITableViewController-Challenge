//
//  TVTableViewController.m
//  UITableViewController Challenge Solution
//
//  Created by Seema Mehta on 21/10/13.
//  Copyright (c) 2013 iDoodle. All rights reserved.
//

#import "TVTableViewController.h"
#import "AstronomicalData.h"
#import "TVSpaceObject.h"
#import "TVSpaceImageViewController.h"
#import "TVSpaceDataViewController.h"

@interface TVTableViewController ()

@end

@implementation TVTableViewController

#define ADDED_SPACE_OBJECTS_KEY @"Added Space Objects Array"

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.planets = [[NSMutableArray alloc] init];
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets]) {
        
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        UIImage *image = [UIImage imageNamed:imageName];
        
        TVSpaceObject *spaceObject = [[TVSpaceObject alloc] initWithData:planetData andImage:image];
        
        [self.planets addObject:spaceObject];
    }
    if (!self.addedSpaceObjects)
    {
        self.addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    NSArray *myPlanetsAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACE_OBJECTS_KEY];
    
    for (NSDictionary *dictionary in myPlanetsAsPropertyLists) {
        TVSpaceObject *spaceObject = [self spaceObjectFromDictionary:dictionary];
        
        [self.addedSpaceObjects addObject:spaceObject];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        if ([segue.destinationViewController isKindOfClass:[TVSpaceImageViewController class]])
        {
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            TVSpaceObject *selectedObject;
            if (path.section == 1) {
                selectedObject = self.addedSpaceObjects[path.row];
            }
            else
            {
                selectedObject = self.planets[path.row];
            }
            TVSpaceImageViewController *spaceImageController = segue.destinationViewController;
            spaceImageController.spaceObject = selectedObject;
        }
    }
    
    if ([sender isKindOfClass:[NSIndexPath class]])
    {
        
        if ([segue.destinationViewController isKindOfClass:[TVSpaceDataViewController class]])
        {
            NSIndexPath *path = sender;
            TVSpaceObject *selectedObject;
            if (path.section == 1) {
                selectedObject = self.addedSpaceObjects[path.row];
            }
            else
            {
                selectedObject = self.planets[path.row];
            }
            TVSpaceDataViewController *spaceDataController = segue.destinationViewController;
            spaceDataController.spaceObject = selectedObject;
        }
    }
    
    if ([segue.destinationViewController isKindOfClass:[TVAddSpaceObjectViewController class]]) {
        TVAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        addSpaceObjectVC.delegate = self;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper methods

-(NSDictionary *)spaceObjectAsPropertyList:(TVSpaceObject *)spaceOject
{
    NSData *imageData = UIImagePNGRepresentation(spaceOject.spaceObjectImage);
    NSDictionary *dictionary = @{PLANET_NAME : spaceOject.name,
                                 PLANET_NICKNAME : spaceOject.nickname,
                                 PLANET_GRAVITY : @(spaceOject.gravitationalForce),
                                 PLANET_DIAMETER : @(spaceOject.diameter),
                                 PLANET_TEMPERATURE : @(spaceOject.temperature),
                                 PLANET_YEAR_LENGTH : @(spaceOject.yearLength),
                                 PLANET_DAY_LENGTH : @(spaceOject.dayLength),
                                 PLANET_NUMBER_OF_MOONS : @(spaceOject.numberOfMoons),
                                 PLANET_INTERESTING_FACT : spaceOject.interestFact,
                                 PLANET_IMAGE : imageData};
    
    return dictionary;
}

-(TVSpaceObject *)spaceObjectFromDictionary:(NSDictionary *)dictionary
{
    
    TVSpaceObject *spaceObject = [[TVSpaceObject alloc] initWithData:dictionary andImage:[UIImage imageWithData:dictionary[PLANET_IMAGE]]];
    
    return spaceObject;
}

#pragma mark - TVAddSpaceObjectViewControllerDelegate

-(void)addSpaceObject:(TVSpaceObject *)spaceObject
{
    if (!self.addedSpaceObjects)
    {
        self.addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    
    [self.addedSpaceObjects addObject:spaceObject];
    
    //persist new space object to NSUserDefaults
    NSMutableArray *spaceObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACE_OBJECTS_KEY] mutableCopy];
    
    if (!spaceObjectsAsPropertyLists) spaceObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    
    [spaceObjectsAsPropertyLists addObject:[self spaceObjectAsPropertyList:spaceObject]];
    
    [[NSUserDefaults standardUserDefaults] setObject:spaceObjectsAsPropertyLists forKey:ADDED_SPACE_OBJECTS_KEY];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];

    [self.tableView reloadData];
}

-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self.addedSpaceObjects count]) {
        return 2;
    }
    else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return [self.addedSpaceObjects count];
    }
    else
    {
        return [self.planets count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 1)
    {
        TVSpaceObject *planet = self.addedSpaceObjects[indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceObjectImage;
    }
    else
    {
        TVSpaceObject *planet = self.planets[indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceObjectImage;
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];

    return cell;
}

#pragma mark UITableView Delegate

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    static NSString *segueIdentifier = @"push to space data";
    [self performSegueWithIdentifier:segueIdentifier sender:indexPath];
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) return YES;
    else return NO;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self.addedSpaceObjects removeObjectAtIndex:indexPath.row];
        
        NSMutableArray *newSavedSpaceObjects = [[NSMutableArray alloc] init];
        
        for (TVSpaceObject *spaceObject in self.addedSpaceObjects) {
            [newSavedSpaceObjects addObject:[self spaceObjectAsPropertyList:spaceObject]];
        }
        [[NSUserDefaults standardUserDefaults] setObject:newSavedSpaceObjects forKey:ADDED_SPACE_OBJECTS_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];

        if (self.addedSpaceObjects.count > 0) {
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        else {
            [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
