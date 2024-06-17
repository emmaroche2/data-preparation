//
//  Observer.m
//  NSNotificationCenter
//
//  Created by Carlos Butron on 01/09/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Observer.h"

@implementation Observer

- (id) initWithName: (NSString *) name notification: (NSString *) notification
{
    if (self = [super init]) {
        self.name = name;
        NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(reciveNotification:)
                       name:notification
                     object:nil];
    }
    
    return self;
}

- (void) reciveNotification: (NSNotification *) notification
{
    NSLog(@"Object %@ has received the notification %@", self.name, notification.name);
}

@end
