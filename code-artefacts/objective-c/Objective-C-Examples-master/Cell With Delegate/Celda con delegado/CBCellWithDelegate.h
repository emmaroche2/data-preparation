//
//  CBCellWithDelegate.h
//  Cell With Delegate
//
//  Created by Carlos on 13/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Messages

-(void)showMessage:(NSString *) msg;

@end

@interface CBCellWithDelegate : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) id<Messages> delegate;

- (IBAction)delegate:(id)sender;

@end
