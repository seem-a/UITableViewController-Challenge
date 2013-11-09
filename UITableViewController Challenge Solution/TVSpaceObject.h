//
//  TVSpaceObject.h
//  UITableViewController Challenge Solution
//
//  Created by Seema Mehta on 22/10/13.
//  Copyright (c) 2013 iDoodle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TVSpaceObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoons;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *interestFact;
@property (strong, nonatomic) UIImage *spaceObjectImage;


-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image;

@end
