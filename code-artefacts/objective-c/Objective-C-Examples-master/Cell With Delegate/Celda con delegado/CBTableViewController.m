//
//  CBTableViewController.m
//  Cell With Delegate
//
//  Created by Carlos on 13/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBTableViewController.h"
#import "CBCellWithDelegate.h"

@interface CBTableViewController () <Messages>

@end

@implementation CBTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CBCellWithDelegate *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.lblName.text = @"iPhone";
            break;
        case 1:
            cell.lblName.text = @"iPod";
            break;
        case 2:
            cell.lblName.text = @"iPad";
            break;
        case 3:
            cell.lblName.text = @"Mac";
            break;
        default:
            break;
    }
    
    cell.delegate = self;
    
    // Configure the cell...
    return cell;
}

- (void)showMessage:(NSString *)msg
{
    UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"I am..." message:msg delegate:self cancelButtonTitle:@"close" otherButtonTitles:nil];
    [alerta show];
}

@end
