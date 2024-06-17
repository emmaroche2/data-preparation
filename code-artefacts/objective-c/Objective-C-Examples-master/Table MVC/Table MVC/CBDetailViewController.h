//
//  CBDetalleViewController.h
//  TableMVC
//
//  Created by Carlos on 12/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBContact.h"

@interface CBDetailViewController : UITableViewController

@property (weak, nonatomic) CBContact * contact;

@end
