//
//  Line.m
//  Board with Touch Events
//
//  Created by Carlos on 06/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "Line.h"

@implementation Line
@synthesize points = _points;

- (id)initWithRect:(CGRect)points 
{
    self = [super init];
    if (self) {
        self.points = points;
    }
    
    return self;
}

@end
