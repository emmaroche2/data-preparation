//
//  CBAddViewController.h
//  TableMVC
//
//  Created by Carlos on 12/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBContact.h"

@protocol CBAddViewControllerDelegate

- (void)save:(CBContact *)contact;

@end

@interface CBAddViewController : UIViewController <UITextFieldDelegate>

@property (strong) id <CBAddViewControllerDelegate> delegate;

@end
