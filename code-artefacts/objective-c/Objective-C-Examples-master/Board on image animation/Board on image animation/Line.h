//
//  Line.h
//  Board with Touch Events
//
//  Created by Carlos on 06/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Line : NSObject

@property (readwrite) CGRect points;

- (id) initWithRect:(CGRect) points;

@end
