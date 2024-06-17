//
//  CBCustomSegueOpen.m
//  CustomSegues
//
//  Created by Carlos on 04/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBCustomSegueOpen.h"

@implementation CBCustomSegueOpen

- (void)perform 
{
    UIViewController * source = self.sourceViewController;
    UIViewController * destination = self.destinationViewController;
    
    destination.view.transform = CGAffineTransformMakeScale(0, 0);
    
    [source.view.window addSubview:destination.view];
    [UIView beginAnimations:@"open" context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(finishAnimation:)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    destination.view.transform = CGAffineTransformMakeScale(1, 1);
    
    [UIView commitAnimations];
}

- (void)finishAnimation:(NSString *) name
{
    UIViewController * source = self.sourceViewController;
    UIViewController * destination = self.destinationViewController;
    
    [source.view.window setRootViewController:destination];
}

@end
