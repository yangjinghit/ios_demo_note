//
//  UIButton+Ketang.m
//  MyNote
//
//  Created by yangjing on 2019/2/28.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import "UIButton+Ketang.h"
#import "KetangUtility.h"
#import "UIImage+Ketang.h"

@implementation UIButton (Ketang)

+ (UIButton *)contentButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *writeText = title;
    [button setTitle:writeText forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    UIFont *writeButtonFont = [UIFont systemFontOfSize:14];
    button.titleLabel.font = writeButtonFont;
    button.layer.cornerRadius = 5;
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.masksToBounds = YES;
    
    CGSize writeButtonSize = CGSizeMake([KetangUtility screenWidth], 29);
    NSDictionary *writeButtonAttributes = [NSDictionary dictionaryWithObjectsAndKeys:button.titleLabel.font, NSFontAttributeName, nil];
    CGRect writeButtonRect = [writeText boundingRectWithSize:writeButtonSize options:kNilOptions attributes:writeButtonAttributes context:nil];
    CGFloat plannedWriteButtonWidth = writeButtonRect.size.width + 16;
    if (plannedWriteButtonWidth <55) {
        plannedWriteButtonWidth = 55;
    }
    [button setFrame:CGRectMake(0, 0, plannedWriteButtonWidth, 29)];
    
    UIImage *activeImage = [UIImage imageWithColor:[UIColor grayColor] andSize:button.frame.size];
    [button setBackgroundImage:activeImage forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UIButton *)navigationButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIFont *buttonFont = [UIFont systemFontOfSize:14];
    button.titleLabel.font = buttonFont;
    
    UIEdgeInsets stretch = UIEdgeInsetsMake(0, 8, 0, 8);
    UIImage *normalImage = [UIImage imageNamed:@""];
    normalImage = [normalImage resizableImageWithCapInsets:stretch resizingMode:UIImageResizingModeStretch];
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    UIImage *activeImage = [UIImage imageNamed:@""];
    activeImage = [activeImage resizableImageWithCapInsets:stretch resizingMode:UIImageResizingModeStretch];
    [button setBackgroundImage:activeImage forState:UIControlStateHighlighted];
    
    CGSize buttonSize = CGSizeMake([KetangUtility screenWidth], 29);
    NSDictionary *buttonAttributes = [NSDictionary dictionaryWithObjectsAndKeys:button.titleLabel.font, NSFontAttributeName, nil];
    CGRect buttonRect = [title boundingRectWithSize:buttonSize options:kNilOptions attributes:buttonAttributes context:nil];
    CGFloat plannedbuttonWidth = buttonRect.size.width + 16;
    if (plannedbuttonWidth <55) {
        plannedbuttonWidth = 55;
    }
    [button setFrame:CGRectMake(0, 0, plannedbuttonWidth, 29)];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
    
}

+ (UIButton *)navigationBackButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIFont *buttonFont = [UIFont systemFontOfSize:14];
    button.titleLabel.font = buttonFont;
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 7, 0, 0);
    button.contentEdgeInsets = padding;
    
    UIEdgeInsets stretch = UIEdgeInsetsMake(0, 15, 0, 8);
    UIImage *normalImage = [UIImage imageNamed:@""];
    normalImage = [normalImage resizableImageWithCapInsets:stretch resizingMode:UIImageResizingModeStretch];
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    UIImage *activeImage = [UIImage imageNamed:@""];
    activeImage = [activeImage resizableImageWithCapInsets:stretch resizingMode:UIImageResizingModeStretch];
    [button setBackgroundImage:activeImage forState:UIControlStateHighlighted];
    
    CGSize buttonSize = CGSizeMake([KetangUtility screenWidth], 29);
    NSDictionary *buttonAttributes = [NSDictionary dictionaryWithObjectsAndKeys:button.titleLabel.font, NSFontAttributeName, nil];
    CGRect buttonRect = [title boundingRectWithSize:buttonSize options:kNilOptions attributes:buttonAttributes context:nil];
    CGFloat plannedbuttonWidth = buttonRect.size.width + 23;
    if (plannedbuttonWidth <55) {
        plannedbuttonWidth = 55;
    }
    [button setFrame:CGRectMake(0, 0, plannedbuttonWidth, 29)];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
