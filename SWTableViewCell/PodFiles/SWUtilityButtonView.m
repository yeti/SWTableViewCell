//
//  SWUtilityButtonView.m
//  SWTableViewCell
//
//  Created by Matt Bowman on 11/27/13.
//  Copyright (c) 2013 Chris Wendel. All rights reserved.
//

#import "SWUtilityButtonView.h"
#import "SWUtilityButtonTapGestureRecognizer.h"
#import "SWConstants.h"

@implementation SWUtilityButtonView

#pragma mark - SWUtilityButonView initializers

- (id)initWithUtilityButtons:(NSArray *)utilityButtons parentCell:(SWTableViewCell *)parentCell utilityButtonSelector:(SEL)utilityButtonSelector
{
    self = [super init];
    
    if (self) {
        self.utilityButtons = utilityButtons;
        self.utilityButtonWidth = [self calculateUtilityButtonWidth];
        self.parentCell = parentCell;
        self.utilityButtonSelector = utilityButtonSelector;
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame utilityButtons:(NSArray *)utilityButtons parentCell:(SWTableViewCell *)parentCell utilityButtonSelector:(SEL)utilityButtonSelector
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.utilityButtons = utilityButtons;
        self.utilityButtonWidth = [self calculateUtilityButtonWidth];
        self.parentCell = parentCell;
        self.utilityButtonSelector = utilityButtonSelector;
    }
    
    return self;
}

#pragma mark Populating utility buttons

- (CGFloat)calculateUtilityButtonWidth
{
  /* Add in this bad boy to fill up whole screen */
  CGFloat buttonWidth;
  if ([_utilityButtons count] > 1) {
    buttonWidth = kUtilityButtonWidthDefault;
    if (buttonWidth * _utilityButtons.count > kUtilityButtonsWidthMax)
    {
        CGFloat buffer = (buttonWidth * _utilityButtons.count) - kUtilityButtonsWidthMax;
        buttonWidth -= (buffer / _utilityButtons.count);
    }
  } else {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    buttonWidth = screenRect.size.width;
  }
    return buttonWidth;
}


- (CGFloat)utilityButtonsWidth
{
    return (_utilityButtons.count * _utilityButtonWidth);
}

- (void)populateUtilityButtonsOnSide:(NSString*)side WithXDiff:(NSNumber*)diff AndYDiff:(NSNumber *)yDiff  {
  
  if ([side isEqualToString:@"left"]) {
    
    NSUInteger utilityButtonsCounter = 0;
    for (UIButton *utilityButton in _utilityButtons) {
      CGFloat utilityButtonXCord = [diff floatValue];
      
      //NSLog(@"%f", CGRectGetHeight(self.bounds) - 10.0);
      
      [utilityButton setFrame:CGRectMake(utilityButtonXCord, [yDiff floatValue], _utilityButtonWidth, CGRectGetHeight(self.bounds) - ([yDiff floatValue]*2.0))];
      
      [utilityButton setTag:utilityButtonsCounter];
      SWUtilityButtonTapGestureRecognizer *utilityButtonTapGestureRecognizer = [[SWUtilityButtonTapGestureRecognizer alloc] initWithTarget:_parentCell
                                                                                                                                    action:_utilityButtonSelector];
      utilityButtonTapGestureRecognizer.buttonIndex = utilityButtonsCounter;
      [utilityButton addGestureRecognizer:utilityButtonTapGestureRecognizer];
      [self addSubview: utilityButton];
      utilityButtonsCounter++;
    }
    
  } else {
    
    NSUInteger utilityButtonsCounter = 0;
    for (UIButton *utilityButton in _utilityButtons) {
      
      CGFloat utilityButtonXCord = 0;
      
      if (utilityButtonsCounter >= 1) {
        utilityButtonXCord = _utilityButtonWidth * utilityButtonsCounter;
      }
      [utilityButton setFrame:CGRectMake(utilityButtonXCord, [yDiff floatValue], _utilityButtonWidth - [diff floatValue], CGRectGetHeight(self.bounds) - ([yDiff floatValue]*2.0))];
      
      [utilityButton setTag:utilityButtonsCounter];
      SWUtilityButtonTapGestureRecognizer *utilityButtonTapGestureRecognizer = [[SWUtilityButtonTapGestureRecognizer alloc] initWithTarget:_parentCell
                                                                                                                                    action:_utilityButtonSelector];
      utilityButtonTapGestureRecognizer.buttonIndex = utilityButtonsCounter;
      [utilityButton addGestureRecognizer:utilityButtonTapGestureRecognizer];
      [self addSubview: utilityButton];
      utilityButtonsCounter++;
    }
    
  }
  
}

//- (void)setHeight:(CGFloat)height
//{
//    for (NSUInteger utilityButtonsCounter = 0; utilityButtonsCounter < _utilityButtons.count; utilityButtonsCounter++) {
//      
//      UIButton *utilityButton = (UIButton *)_utilityButtons[utilityButtonsCounter];
//      CGFloat utilityButtonXCord = 0;
//      if (utilityButtonsCounter >= 1) {
//        utilityButtonXCord = _utilityButtonWidth * utilityButtonsCounter;
//      }
//      [utilityButton setFrame:CGRectMake(utilityButtonXCord, 0, _utilityButtonWidth, height)];
//    }
//}

- (void)setHeight:(CGFloat)height withXDiff:(NSNumber*)xDiff YDiff:(NSNumber*)yDiff ForSide:(NSString*)side
{
  if ([side isEqualToString:@"left"]) {
    for (NSUInteger utilityButtonsCounter = 0; utilityButtonsCounter < _utilityButtons.count; utilityButtonsCounter++) {
      
      UIButton *utilityButton = (UIButton *)_utilityButtons[utilityButtonsCounter];
      CGFloat utilityButtonXCord = 0;
      if (utilityButtonsCounter >= 1) {
        utilityButtonXCord = _utilityButtonWidth * utilityButtonsCounter;
      }
      [utilityButton setFrame:CGRectMake(utilityButtonXCord + [xDiff floatValue], [yDiff floatValue], _utilityButtonWidth, height - ([yDiff floatValue]*2.0f))];
    }
  } else {
    for (NSUInteger utilityButtonsCounter = 0; utilityButtonsCounter < _utilityButtons.count; utilityButtonsCounter++) {
      
      UIButton *utilityButton = (UIButton *)_utilityButtons[utilityButtonsCounter];
      CGFloat utilityButtonXCord = 0;
      if (utilityButtonsCounter >= 1) {
        utilityButtonXCord = _utilityButtonWidth * utilityButtonsCounter;
      }
      [utilityButton setFrame:CGRectMake(utilityButtonXCord, [yDiff floatValue], _utilityButtonWidth -  + [xDiff floatValue], height - ([yDiff floatValue]*2.0f))];
    }
  }
}

@end

