//
//  CBTPopover.h
//  Navegador iPad
//
//  Created by Carlos on 07/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CBPooverDelegate

- (void)selectedURL:(NSString *)url PopoverController:(UIPopoverController *)popover;

@end

@interface CBTPopover : UITableViewController

@property (strong) id<CBPooverDelegate> delegate;
@property (weak) NSMutableArray *history;
@property (weak) UIPopoverController *popover;

@end
