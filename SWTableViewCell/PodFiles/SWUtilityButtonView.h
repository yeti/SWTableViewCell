//
//  SWUtilityButtonView.h
//  SWTableViewCell
//
//  Created by Matt Bowman on 11/27/13.
//  Copyright (c) 2013 Chris Wendel. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWTableViewCell;

@interface SWUtilityButtonView : UIView

@property (nonatomic, strong) NSArray *utilityButtons;
@property (nonatomic) CGFloat utilityButtonWidth;
@property (nonatomic, weak) SWTableViewCell *parentCell;
@property (nonatomic) SEL utilityButtonSelector;
@property (nonatomic) CGFloat height;

- (id)initWithUtilityButtons:(NSArray *)utilityButtons parentCell:(SWTableViewCell *)parentCell utilityButtonSelector:(SEL)utilityButtonSelector;

- (id)initWithFrame:(CGRect)frame utilityButtons:(NSArray *)utilityButtons parentCell:(SWTableViewCell *)parentCell utilityButtonSelector:(SEL)utilityButtonSelector;

- (void)populateUtilityButtonsOnSide:(NSString*)side WithXDiff:(NSNumber*)diff AndYDiff:(NSNumber*)yDiff;
- (CGFloat)utilityButtonsWidth;

- (void)setHeight:(CGFloat)height withXDiff:(NSNumber*)xDiff YDiff:(NSNumber*)yDiff ForSide:(NSString*)side;


@end
