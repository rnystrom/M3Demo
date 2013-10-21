//
//  SwitchView.h
//  M3Test
//
//  Created by Ryan Nystrom on 10/21/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchView : UIControl

@property (nonatomic, assign) BOOL isOn;

- (void)setIsOn:(BOOL)isOn animated:(BOOL)animated;

@end
