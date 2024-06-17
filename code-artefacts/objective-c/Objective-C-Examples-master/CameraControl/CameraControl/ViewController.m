//
//  ViewController.m
//  CameraControl
//
//  Created by Carlos Butron on 10/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];

    //singleTAP in imageView
    [self.imageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapping:)];
    [singleTap setNumberOfTapsRequired:1];
    [self.imageView addGestureRecognizer:singleTap];
    [self.view addSubview:self.imageView];

    //another things
    //....
    //if you dont have camera send an error message
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                          message:@"Device has no camera"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles: nil];
    [myAlertView show];
    }
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

//SingleTap in imageView
- (void)singleTapping:(UIGestureRecognizer *)recognizer 
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select the operation to proceed?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Take Photo", @"Select Photo", nil];
    [actionSheet showInView:self.view];
    
    
    
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

//actionSheet to select imageAction
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex 
{
    if(buttonIndex == 0) {
        NSLog(@"Take Photo Button Clicked");
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
        [self presentViewController:picker animated:YES completion:NULL];
    }
    else if(buttonIndex == 1) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker 
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
