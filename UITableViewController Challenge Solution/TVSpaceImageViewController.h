//
//  TVSpaceImageViewController.h
//  UITableViewController Challenge Solution
//
//  Created by Seema Mehta on 24/10/13.
//  Copyright (c) 2013 iDoodle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TVSpaceObject.h"

@interface TVSpaceImageViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) TVSpaceObject *spaceObject;
@end
