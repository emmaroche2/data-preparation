//
//  ViewController.m
//  CoreLocationApp
//
//  Created by Carlos Butron on 11/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "MainViewController.h"
@import CoreLocation;

@interface MainViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *altitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *headingLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;

@end

@implementation MainViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
    
    [self locationManagerStart];
}


- (void)locationManagerStart 
{
    //startup
    self.locationManager = [[CLLocationManager alloc] init];
    
    //check if services enabled
    if ([CLLocationManager locationServicesEnabled]) {
        //ask for permission
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
            //add to plist :NSLocationWhenInUseUsageDescription
        }
    }

    //start service
    self.locationManager.delegate = self;
    
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager startUpdatingLocation];
    
    if ([CLLocationManager headingAvailable]) {
        [self.locationManager startUpdatingHeading];
    }
}

- (void)viewDidDisappear:(BOOL)animated 
{
    [self.locationManager stopUpdatingHeading];
    [self.locationManager stopUpdatingLocation];
}

//implement delegate methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations 
{
    CLLocation *location = locations.lastObject;
    self.latitudeLabel.text = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f", location.coordinate.longitude];
    self.altitudeLabel.text = [NSString stringWithFormat:@"%.01f", location.altitude];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading 
{
    self.headingLabel.text = [NSString stringWithFormat:@"%.01f", newHeading.trueHeading];
    //Rotate 270 degrees the label text of Yorkie's gender (M_PI * 270 /-180) 90º
    //[yorkieMainCell.genderYorkieMainLabel setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    [self.arrowImageView setTransform:CGAffineTransformMakeRotation(newHeading.trueHeading * (M_PI / -180))];
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager 
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
