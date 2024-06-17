//
//  CBTableViewController.m
//  TableMVC
//
//  Created by Carlos on 12/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBTableViewController.h"
#import "CBContact.h"
#import "CBDetailViewController.h"

@interface CBTableViewController ()

- (IBAction)addContact:(id)sender;

@property (strong, nonatomic) NSMutableArray * model;

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

    self.model = [NSMutableArray new];
    
    CBContact * c1 = [[CBContact alloc] initWithName:@"Name1" email:@"email1" phone:@"phone1"];
    CBContact * c2 = [[CBContact alloc] initWithName:@"Name2" email:@"email2" phone:@"phone2"];
    CBContact * c3 = [[CBContact alloc] initWithName:@"Name3" email:@"email3" phone:@"phone3"];
    
    NSLog(@"%@, %@, %@", c1.name, c1.email, c1.phone);
    
    [self.model addObject:c1];
    [self.model addObject:c2];
    [self.model addObject:c3];
    
    
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
    return self.model.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    CBContact * c = [self.model objectAtIndex:indexPath.row];
    cell.textLabel.text = c.name;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard * stb = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    CBDetailViewController * c = [stb instantiateViewControllerWithIdentifier:@"detail"];
    c.contact = [self.model objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:c animated:YES];
    
}

- (IBAction)addContact:(id)sender
{
    UIStoryboard * stb = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    CBAddViewController * c = [stb instantiateViewControllerWithIdentifier:@"add"];
    c.delegate = self;
    [self presentViewController:c animated:YES completion:nil];
}

- (void) save:(CBContact *)contact
{
    [self.model addObject:contact];
    [self.tableView reloadData];
}

@end
