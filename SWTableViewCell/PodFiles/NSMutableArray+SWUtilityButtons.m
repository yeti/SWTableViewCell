//
//  NSMutableArray+SWUtilityButtons.m
//  SWTableViewCell
//
//  Created by Matt Bowman on 11/27/13.
//  Copyright (c) 2013 Chris Wendel. All rights reserved.
//

#import "NSMutableArray+SWUtilityButtons.h"

@implementation NSMutableArray (SWUtilityButtons)

- (void)sw_addUtilityButtonWithColor:(UIColor *)color title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = color;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:45.0];
    [self addObject:button];
}

- (void)sw_addUtilityButtonWithColor:(UIColor *)color icon:(UIImage *)icon
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = color;
    [button setImage:icon forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:45.0];

    [self addObject:button];
}

- (void)sw_addUtilityButtonWithColor:(UIColor *)color normalIcon:(UIImage *)normalIcon selectedIcon:(UIImage *)selectedIcon {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = color;
    [button setImage:normalIcon forState:UIControlStateNormal];
    [button setImage:selectedIcon forState:UIControlStateHighlighted];
    [button setImage:selectedIcon forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont systemFontOfSize:45.0];

    [self addObject:button];
}

@end

