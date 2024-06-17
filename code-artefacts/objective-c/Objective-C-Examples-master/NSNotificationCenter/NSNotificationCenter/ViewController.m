//
//  CBMainViewController.m
//  AppNotificaciones
//
//  Created by Carlos on 16/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "Observer.h"

@interface ViewController ()

@property (strong) Observer * observer1;
@property (strong) Observer * observer2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.observer1 = [[Observer alloc] initWithName:@"observer1" notification:@"My Notification1"];
    self.observer2 = [[Observer alloc] initWithName:@"observer2" notification:@"My Notification2"];
    
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self
               selector:@selector(reciveNotification:)
                   name:@"UIApplicationDidBecomeActiveNotification"
                 object:nil];
    
    [center addObserver:self
               selector:@selector(reciveNotification:)
                   name:@"UIApplicationDidEnterBackgroundNotification"
                 object:nil];
    
    [center addObserver:self
               selector:@selector(reciveNotification:)
                   name:@"UIApplicationDidReceiveMemoryWarningNotification"
                 object:nil];
    
    [center addObserver:self
               selector:@selector(reciveNotification:)
                   name:@"UIApplicationDidWillTerminateNotification"
                 object:nil];
}


- (void) reciveNotification:(NSNotification *) notification 
{
    NSLog(@"Notification received: %@", notification.name);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
