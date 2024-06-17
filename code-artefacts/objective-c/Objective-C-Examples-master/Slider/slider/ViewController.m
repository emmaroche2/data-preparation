//
//  ViewController.m
//  slider
//
//  Created by Carlos Butron on 06/05/16.
//  Copyright © 2016 Carlos Butron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *SDSlider;
@property (strong, nonatomic) UILabel *SDlabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.SDlabel = [[UILabel alloc] init];
    self.SDlabel.textColor = [UIColor blackColor];
    [self.SDlabel setFrame:CGRectMake(0, 0, 20, 20)];
    self.SDlabel.backgroundColor=[UIColor clearColor];
    self.SDlabel.userInteractionEnabled=NO;
    self.SDlabel.text= @"";
    [self.view addSubview:self.SDlabel];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sliderValueChanged:(UISlider *)sender
{
    self.SDlabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    
    CGRect trackRect = [self.SDSlider trackRectForBounds:self.SDSlider.bounds];
    CGRect thumbRect = [self.SDSlider thumbRectForBounds:self.SDSlider.bounds
                                               trackRect:trackRect
                                                   value:self.SDSlider.value];
    
    self.SDlabel.text = [NSString stringWithFormat:@"%.0f", self.SDSlider.value];
    
    NSLog(@"thumbRect.origin.x %f",thumbRect.origin.x);
    NSLog(@"self.testSDlabel %f",self.SDlabel.center.x);
    
    self.SDlabel.center = CGPointMake(thumbRect.origin.x + self.SDSlider.frame.origin.x * 2.4 , self.SDSlider.frame.origin.y * 1.7);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
