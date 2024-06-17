//
//  RectanglesView.m
//  Drawing Functions
//
//  Created by Carlos Butron on 31/08/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "RectanglesView.h"

@implementation RectanglesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddRect(context, CGRectMake(20, 20, rect.size.width-40, rect.size.height-90));
    CGContextAddRect(context, CGRectMake(60, 60, rect.size.width-120, rect.size.height-170));
    
    CGContextStrokePath(context);
}

@end
