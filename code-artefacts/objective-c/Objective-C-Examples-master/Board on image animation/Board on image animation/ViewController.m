//
//  ViewController.m
//  Board with Touch Events
//
//  Created by Carlos on 06/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UISlider *velocitySlider;
@property (weak, nonatomic) IBOutlet UILabel *velocityLabel;
@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;

- (IBAction)imageSelect:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.notificationLabel.alpha=0.0;
    [self addObserver:self forKeyPath:@"velocitySlider.value" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)labelUpdate:(id)sender 
{
    self.notificationLabel.text = [NSString stringWithFormat:@"%1.1f s", self.velocitySlider.value];
}

- (IBAction)imageSelect:(id)sender 
{
    //modal view to select image
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    imagePicker.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
    //dismiss
    [picker dismissViewControllerAnimated:YES completion:nil];
    //assign alpla 0 to background
    self.backgroundImage.alpha=0.0;
    //assign new image to background
    [self.backgroundImage setImage:info[UIImagePickerControllerOriginalImage]];
    
    [UIView beginAnimations:nil context:nil];
    //animation duration and velocity
    [UIView setAnimationDuration:self.velocitySlider.value];
    //set linear curve
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    //animation alpha at the end
    self.backgroundImage.alpha = 0.9;
    
    [UIView commitAnimations];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context 
{
    CGPoint center = self.notificationLabel.center;
    center.y = 78;
    self.notificationLabel.center = center;
    self.notificationLabel.alpha=1.0;
   
    //set animation
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:2.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    center.y = 20;
    self.notificationLabel.center = center;
    self.notificationLabel.alpha=0.0;

    [UIView commitAnimations];
}

@end
