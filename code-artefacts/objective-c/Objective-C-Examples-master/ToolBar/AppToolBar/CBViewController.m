//
//  CBViewController.m
//  AppToolBar
//
//  Created by Carlos on 30/01/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBViewController.h"

@interface CBViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblText;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btn1;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btn2;

- (IBAction)delete:(id)sender;
- (IBAction)update:(id)sender;

@property (strong, nonatomic) NSMutableArray * model;

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.model = [NSMutableArray new];
    [self.model addObject:@"Position1"];
    [self.model addObject:@"Position2"];
    [self delete:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)delete:(id)sender 
{
    self.lblText.text = @"";
}

- (IBAction)update:(id)sender 
{
    if (sender == self.btn1) {
        self.lblText.text = [self.model objectAtIndex:0];
    }
    
    if (sender == self.btn2) {
        self.lblText.text = [self.model objectAtIndex:1];
    }
}

@end
