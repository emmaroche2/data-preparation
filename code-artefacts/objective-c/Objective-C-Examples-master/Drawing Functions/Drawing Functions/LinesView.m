//
//  LinesView.m
//  Drawing Functions
//
//  Created by Carlos Butron on 31/08/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "LinesView.h"

@implementation LinesView

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
    
    UIColor * green = [UIColor greenColor];
    UIColor * blue = [UIColor blueColor];
    
    CGContextSetLineWidth(context, 5);
    CGContextSetStrokeColorWithColor(context, green.CGColor);
    CGContextMoveToPoint(context, 20, 20);
    CGContextAddLineToPoint(context, rect.size.width-20, 20);
    CGContextStrokePath(context);
    CGContextSetStrokeColorWithColor(context, blue.CGColor);
    CGContextMoveToPoint(context, 20, 20);
    CGContextAddLineToPoint(context, 20, rect.size.height-70);
    CGContextStrokePath(context);
}

@end
