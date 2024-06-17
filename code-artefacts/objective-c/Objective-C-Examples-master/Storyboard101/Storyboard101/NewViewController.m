//
//  NewViewController.m
//  Storyboard101
//
//  Created by Carlos Butron on 06/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@property (nonatomic, strong) UILabel *lblMain;

@end

@implementation NewViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
    
    self.lblMain = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 44)];
    self.lblMain.text = @"Hello, I come from a code";
    self.lblMain.textColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

@end
