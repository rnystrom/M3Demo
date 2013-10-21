//
//  SwitchView.m
//  M3Test
//
//  Created by Ryan Nystrom on 10/21/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import "SwitchView.h"

@interface SwitchView ()

@end

@implementation SwitchView

- (void)awakeFromNib {
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = NO;
}

- (void)setIsOn:(BOOL)isOn {
    [self setIsOn:isOn animated:NO];
}

- (void)setIsOn:(BOOL)isOn animated:(BOOL)animated {
    _isOn = isOn;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    rect.size.height -= 6;
    rect.size.width -= 1;
    // ...
    
    // draw background
    UIBezierPath *backgroundBezier = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:CGRectGetHeight(rect)/2];
    [[UIColor colorWithRed:138/255.f green:221/255.f blue:109/255.f alpha:1] setFill];
    [backgroundBezier fill];
    
// create switch shape
CGFloat borderWidth = 2;
CGRect switchFrame = CGRectInset(rect, borderWidth, borderWidth);
switchFrame.size.width = switchFrame.size.height;
switchFrame.origin.x = rect.size.width - switchFrame.size.width - borderWidth/2;
UIBezierPath *switchBezier = [UIBezierPath
                              bezierPathWithRoundedRect:switchFrame
                              cornerRadius:rect.size.height/2];
    
    // draw switch shadow
    CGContextSaveGState(ctx);
    {
        CGContextSetShadowWithColor(ctx, CGSizeMake(0, 5), 5, [UIColor colorWithWhite:0 alpha:0.4].CGColor);
        [switchBezier fill];
    }
    CGContextRestoreGState(ctx);
    
    // draw switch gradient
    CGContextSaveGState(ctx);
    {
        [switchBezier addClip];
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGFloat points[] = {0, 1};
        NSArray *colors = @[(id)[UIColor whiteColor].CGColor, (id)[UIColor colorWithWhite:0.95f alpha:1].CGColor];
        CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)(colors), points);
        CGContextDrawLinearGradient(ctx, gradient, rect.origin, CGPointMake(0, rect.size.height), 0);
    }
    CGContextRestoreGState(ctx);
    
    // draw switch border
    [[UIColor colorWithWhite:0.85f alpha:1] setStroke];
    CGContextSetLineWidth(ctx, 2);
    [switchBezier stroke];
}

@end
