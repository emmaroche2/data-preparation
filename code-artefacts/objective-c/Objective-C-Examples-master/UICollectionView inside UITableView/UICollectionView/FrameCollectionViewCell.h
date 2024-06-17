//
//  FrameCollectionViewCell.h
//  UICollectionView
//
//  Created by Carlos Butron on 31/08/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FrameCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) NSString * text;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;

@end
