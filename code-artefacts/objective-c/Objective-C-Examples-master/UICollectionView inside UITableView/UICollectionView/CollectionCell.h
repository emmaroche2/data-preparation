//
//  CollectionCell.h
//  UICollectionView
//
//  Created by Carlos Butron on 31/08/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionCell : UITableViewCell <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *clcCollection;
@property (strong, nonatomic) NSMutableArray *collection;

@end
