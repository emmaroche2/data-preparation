//
//  ViewController.m
//  Animation
//
//  Created by Carlos Butron on 24/08/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () 
{
    BOOL isAnimated;
}

@property (weak, nonatomic) IBOutlet UIImageView *image;

- (IBAction)animation:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
    isAnimated = NO;
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

- (IBAction)animation:(id)sender 
{
    if (!isAnimated) {
        isAnimated = YES;
        
        [UIView beginAnimations:@"MyAnimation" context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationRepeatCount:3.0];
        [UIView setAnimationRepeatAutoreverses:YES];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationDidEnd:)];
        
        CGPoint centro = self.image.center;
        centro.y += 50;
        self.image.center = centro;
        
        self.image.alpha = 0.0;
        
        [UIView commitAnimations];
    }
}

- (void)animationDidEnd:(NSString *)nombre 
{
    if ([nombre isEqualToString:@"MyAnimation"]) {
        CGPoint centro = self.image.center;
        centro.y -= 50;
        self.image.center = centro;
        
        self.image.alpha = 1.0;
        isAnimated = NO;
    }
}

@end
