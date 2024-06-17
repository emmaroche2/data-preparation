//
//  CBCustomSegueClose.m
//  CustomSegues
//
//  Created by Carlos on 04/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBCustomSegueClose.h"

@implementation CBCustomSegueClose

- (void)perform 
{
    UIViewController * source = self.sourceViewController;
    UIViewController * destination = self.destinationViewController;
    
    destination.view.transform = CGAffineTransformMakeScale(1, 1);
    
    [source.view.window addSubview:destination.view];
    [source.view.window addSubview:source.view];
    
    [UIView beginAnimations:@"close" context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(finishAnimation:)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    //CGAffineTransformRotate(CGAffineTransformMakeScale(0.8, 0.8), M_PI_2*0.3);
    source.view.transform = CGAffineTransformMakeScale(0.8, 0.8);  //do it smaller and disappear to top
    //source.view.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(0.8, 0.8), M_PI_2*0.3); //rotate and disappear to top
    
    [UIView commitAnimations];
}

- (void)finishAnimation:(NSString *) name
{
    UIViewController * source = self.sourceViewController;
    
    [UIView beginAnimations:@"close2" context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(finishAnimation2:)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    //source = CGAffineTransformTranslate(origen.view.transform, 0, -1000);
    source.view.transform = CGAffineTransformMakeScale(0.8, 0);
    
    [UIView commitAnimations];
}

- (void)finishAnimation2:(NSString *) name
{
    UIViewController * source = self.sourceViewController;
    UIViewController * destination = self.destinationViewController;
    
    [source.view.window setRootViewController:destination];
}

@end
