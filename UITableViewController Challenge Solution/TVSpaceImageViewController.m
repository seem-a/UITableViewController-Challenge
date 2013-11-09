//
//  TVSpaceImageViewController.m
//  UITableViewController Challenge Solution
//
//  Created by Seema Mehta on 24/10/13.
//  Copyright (c) 2013 iDoodle. All rights reserved.
//

#import "TVSpaceImageViewController.h"

@interface TVSpaceImageViewController ()

@end

@implementation TVSpaceImageViewController

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
    
    self.imageView = [[UIImageView alloc] initWithImage:self.spaceObject.spaceObjectImage];
    self.scrollView.contentSize = self.imageView.frame.size;
    [self.scrollView addSubview:self.imageView];
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 2.5;
    self.scrollView.minimumZoomScale = 0.5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}
@end
