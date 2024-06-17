//
//  TableViewController.m
//  Standard UITableViewCells
//
//  Created by Carlos Butron on 30/08/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString * titulo;
    
    switch (section) {
        case 0:
            titulo = @"Default";
            break;
        case 1:
            titulo = @"Subtitle";
            break;
        case 2:
            titulo = @"Value1";
            break;
        case 3:
            titulo = @"Value2";
            break;
            
    }
    
    return titulo;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"Default"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Default"];
            }
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"Subtitle"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Subtitle"];
            }
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"Value1"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Value1"];
            }
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"Value2"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"Value2"];
            }
            break;
            
        default:
            break;
    }
    
    cell.textLabel.text = @"Main text";
    cell.detailTextLabel.text = @"Secondary text";
    cell.imageView.image = [UIImage imageNamed:@"linkedin-small6.png"];
    // Configure the cell...
    
    return cell;
}

@end
