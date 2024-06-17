//
//  FrameCollectionViewCell.m
//  UICollectionView
//
//  Created by Carlos Butron on 31/08/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "FrameCollectionViewCell.h"

@implementation FrameCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)reloadInputViews
{
    self.lblInfo.text = self.text;
    NSLog(@"%@", self.text);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self reloadInputViews];
    // Drawing code
}

@end
