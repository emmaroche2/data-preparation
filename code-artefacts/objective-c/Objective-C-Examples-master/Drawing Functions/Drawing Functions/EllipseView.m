//
//  EllipseView.m
//  Drawing Functions
//
//  Created by Carlos Butron on 31/08/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "EllipseView.h"

@implementation EllipseView

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //CGContextAddEllipseInRect(context, CGRectMake(20, 20, rect.size.width-40, rect.size.height-90));
    //CGContextAddEllipseInRect(context, CGRectMake(60, 60, rect.size.width-120, rect.size.height-170));
    
    UIColor * red = [UIColor redColor];
    UIColor * green = [UIColor greenColor];
    UIColor * blue = [UIColor blueColor];
    UIColor * yellow = [UIColor yellowColor];
    UIColor * orange = [UIColor orangeColor];
    
    int color = 0;
    
    CGContextSetAlpha(context, 0.5);
    
    for (int x=20; x<rect.size.width-30; x=x+10) {
        for (int y=20; y<rect.size.height-80; y=y+10) {
            
            switch (color%5) {
                case 0:
                    CGContextSetStrokeColorWithColor(context, red.CGColor);
                    CGContextSetFillColorWithColor(context, green.CGColor);
                    break;
                case 1:
                    CGContextSetStrokeColorWithColor(context, green.CGColor);
                    CGContextSetFillColorWithColor(context, blue.CGColor);
                    break;
                case 2:
                    CGContextSetStrokeColorWithColor(context, blue.CGColor);
                    CGContextSetFillColorWithColor(context, yellow.CGColor);
                    break;
                case 3:
                    CGContextSetStrokeColorWithColor(context, yellow.CGColor);
                    CGContextSetFillColorWithColor(context, orange.CGColor);
                    break;
                case 4:
                    CGContextSetStrokeColorWithColor(context, orange.CGColor);
                    CGContextSetFillColorWithColor(context, red.CGColor);
                    break;
                    
                default:
                    break;
            }
            
            color++;
            CGContextAddEllipseInRect(context, CGRectMake(x, y, 20, 20));
            CGContextDrawPath(context, kCGPathFillStroke);
        }
    }
   
}

@end
