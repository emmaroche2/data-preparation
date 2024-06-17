//
//  RootViewController.m
//  UICollectionView
//
//  Created by Carlos Butron on 31/08/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "RootViewController.h"
#import "CollectionCell.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize model = _model;

- (NSMutableArray *)model
{
    if (!_model) {
        _model = [NSMutableArray new];
        NSMutableArray * collection;
        
        for (int x=0; x<10; x++) {
            collection = [NSMutableArray new];
            
            for (int y=0; y<10; y++){
                [collection addObject:[NSString stringWithFormat:@"( %d , %d )",x,y]];
            }
            
            [_model addObject:collection];
        }
    }
    
    return _model;
}

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
    return self.model.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"TableCell";
    CollectionCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.collection = [self.model objectAtIndex:indexPath.row];
    cell.clcCollection.delegate = cell;
    cell.clcCollection.dataSource = cell;
    
    [cell reloadInputViews];
    
    return cell;
}

@end
