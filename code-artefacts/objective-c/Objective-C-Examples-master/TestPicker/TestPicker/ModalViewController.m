//
//  ModalViewController.m
//  TestPicker
//
//  Created by Carlos Butron on 07/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

- (IBAction)didTapExitButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        //do something with saving or whatever
        //everything that goes here will get executed after the viewcontroller disappears
    }];
}

@end
