//
//  Observer.h
//  NSNotificationCenter
//
//  Created by Carlos Butron on 01/09/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Observer : NSObject

@property (strong, nonatomic) NSString * name;

- (id) initWithName: (NSString *) name
       notification: (NSString *) notification;

@end
