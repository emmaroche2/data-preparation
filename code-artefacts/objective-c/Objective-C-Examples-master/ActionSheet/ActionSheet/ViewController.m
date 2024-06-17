//
//  ViewController.m
//  ActionSheet
//
//  Created by Carlos Butron on 09/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

- (IBAction)showActionsheet:(id)sender
{
    UIAlertController *view = [UIAlertController alertControllerWithTitle:@"Action Sheet"
                                                                  message:@"Select the operation to proceed?"
                                                           preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"Take Photo"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action) {
                                                          //Do some thing here
                                                          NSLog(@"Take Photo Button Clicked");
                                                          [view dismissViewControllerAnimated:YES completion:nil];
                             
                                                      }];
    UIAlertAction *selectPhoto = [UIAlertAction actionWithTitle:@"Select Photo"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * action) {
                                                            //Do some thing here
                                                            NSLog(@"Select Photo Button Clicked");
                                                            [view dismissViewControllerAnimated:YES completion:nil];
                             
                                                        }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       NSLog(@"Cancel");
                                                       [view dismissViewControllerAnimated:YES completion:nil];
                                 
                                                   }];
    
    [view addAction:takePhoto];
    [view addAction:selectPhoto];
    [view addAction:cancel];
    [self presentViewController:view animated:YES completion:nil];
    
}

@end
