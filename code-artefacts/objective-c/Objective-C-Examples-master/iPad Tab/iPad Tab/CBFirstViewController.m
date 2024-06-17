//
//  CBFirstViewController.m
//  iPad Tab
//
//  Created by Carlos on 06/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBFirstViewController.h"

@interface CBFirstViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *sclContents;

@end

@implementation CBFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sclContents.scrollEnabled = YES;
    self.sclContents.contentSize = CGSizeMake(768, 1400);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
