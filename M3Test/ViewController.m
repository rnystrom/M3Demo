//
//  ViewController.m
//  M3Test
//
//  Created by Ryan Nystrom on 10/21/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import "ViewController.h"
#import "SwitchView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SwitchView *switchView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (IBAction)sliderValueChanged:(id)sender {
    CGFloat ratio = 1.6f;
    CGFloat scale = self.slider.value;
    CGFloat maxSize = self.view.bounds.size.width;
    
    CGFloat newWidth = MAX(scale * maxSize,0.05f);
    CGFloat newHeight = newWidth / ratio;
    
    CGFloat newX = (self.view.bounds.size.width - newWidth)/2;
    CGFloat newY = (self.view.bounds.size.height - newHeight)/2;
    
    self.switchView.frame = CGRectMake(newX, newY, newWidth, newHeight);
    [self.switchView setNeedsDisplay];
}

@end
