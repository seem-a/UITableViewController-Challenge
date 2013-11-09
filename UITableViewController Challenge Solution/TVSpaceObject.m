//
//  TVSpaceObject.m
//  UITableViewController Challenge Solution
//
//  Created by Seema Mehta on 22/10/13.
//  Copyright (c) 2013 iDoodle. All rights reserved.
//

#import "TVSpaceObject.h"
#import "AstronomicalData.h"

@implementation TVSpaceObject

-(id)init
{
    self = [self initWithData:nil andImage:nil];
    
    return self;
}

-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init];
    
    self.name = data[PLANET_NAME];
    self.gravitationalForce = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.temperature = [data[PLANET_TEMPERATURE] floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] integerValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interestFact = data[PLANET_INTERESTING_FACT];
    self.spaceObjectImage = image;
    
    return  self;
}
@end
