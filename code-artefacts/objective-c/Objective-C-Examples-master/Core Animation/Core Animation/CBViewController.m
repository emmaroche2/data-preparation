//
//  CBViewController.m
//  Core Animation
//
//  Created by Carlos on 07/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBViewController.h"

@interface CBViewController ()
{
    BOOL isAnimated;
}

@property (weak, nonatomic) IBOutlet UIView *container;
@property (strong, nonatomic) IBOutlet UIImageView *imgView1;
@property (strong, nonatomic) IBOutlet UIImageView *imgView2;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;

- (IBAction)animate:(id)sender;

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.container addSubview:self.imgView1];
    [self.container addSubview:self.imgView2];
    isAnimated = NO;
    self.imgView2.hidden =  YES;
}


- (void)animationDidStart:(CAAnimation *)anim
{
    isAnimated = YES;
    [self.load startAnimating];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    isAnimated = NO;
    [self.load stopAnimating];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)animate:(id)sender 
{
    if (!isAnimated) {
        CATransition * animation = [CATransition animation];
        animation.duration = 1.0;
        animation.delegate = self;
        
        //animacion.type = kCATransitionReveal;
        animation.type = kCATransitionMoveIn;
        //animacion.type = kCATransitionPush;
        //animacion.type = kCATransitionFade;
        
        //animacion.subtype = kCATransitionFromTop;
        //animacion.subtype = kCATransitionFromBottom;
        //animacion.subtype = kCATransitionFromLeft;
        animation.subtype = kCATransitionFromRight;
        
        //animacion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        //animacion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        //animacion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        //animacion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.container.layer addAnimation:animation forKey:nil];
        
        self.imgView1.hidden = YES;
        self.imgView2.hidden = NO;
        
        UIImageView * tmp = self.imgView1;
        
        self.imgView1 = self.imgView2;
        self.imgView2 = tmp;
    }
}

@end
