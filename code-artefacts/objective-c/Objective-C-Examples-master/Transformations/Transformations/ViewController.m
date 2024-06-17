//
//  ViewController.m
//  Transformations
//
//  Created by Carlos on 08/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)executeAnimation
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
}

- (void)launchAnimation
{
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)center:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformIdentity;
    [self launchAnimation];
}

- (IBAction)turnLeft:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformRotate(self.view.transform, -M_PI_2*0.1);
    [self launchAnimation];
}

- (IBAction)turnRight:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformRotate(self.view.transform, M_PI_2*0.1);
    [self launchAnimation];
}

- (IBAction)up:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformTranslate(self.view.transform, 0, -10);
    [self launchAnimation];
}

- (IBAction)down:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformTranslate(self.view.transform, 0, 10);
    [self launchAnimation];
}

- (IBAction)right:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformTranslate(self.view.transform, 10, 0);
    [self launchAnimation];
}

- (IBAction)left:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformTranslate(self.view.transform, -10, 0);
    [self launchAnimation];
}

- (IBAction)zoomOut:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformScale(self.view.transform, 0.9, 0.9);
    [self launchAnimation];
}

- (IBAction)zoomIn:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformScale(self.view.transform, 1.1, 1.1);
    [self launchAnimation];
}

- (IBAction)compressH:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformScale(self.view.transform, 1, 0.9);
    [self launchAnimation];
}

- (IBAction)expandH:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformScale(self.view.transform, 1, 1.1);
    [self launchAnimation];
}

- (IBAction)compressV:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformScale(self.view.transform, 0.9, 1);
    [self launchAnimation];
}

- (IBAction)expandV:(id)sender 
{
    [self executeAnimation];
    self.view.transform = CGAffineTransformScale(self.view.transform, 1.1, 1);
    [self launchAnimation];
}

@end
