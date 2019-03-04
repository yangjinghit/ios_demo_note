//
//  BlankView.m
//  MyNote
//
//  Created by yangjing on 2019/2/27.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import "BlankView.h"
#import "KetangUtility.h"
#import "UIButton+Ketang.h"

@implementation BlankView


+ (BlankView *)blankViewWithText:(NSString *)text buttonText:(NSString *)buttonText target:(id)target action:(SEL)action{
    
    UIView *blankView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    UILabel *blankLabel = [[UILabel alloc] initWithFrame:CGRectMake(([KetangUtility screenWidth] -100)/2, ([KetangUtility screenHeight] -100)/2, 100, 100)];
    blankLabel.text = text;
    blankLabel.textColor = [UIColor grayColor];
    blankLabel.textAlignment = NSTextAlignmentCenter;
    blankLabel.font = [UIFont systemFontOfSize:17];
    [blankView addSubview:blankLabel];
    
    UIButton *writeButton = [UIButton contentButtonWithTitle:buttonText target:target action:action];
    CGFloat writeButtonX = ([KetangUtility screenWidth] - writeButton.frame.size.width)/2;
    CGFloat writeButtonY = (blankView.frame.size.height - writeButton.frame.size.height)/2 + 60;
    [writeButton setFrame:CGRectMake(writeButtonX, writeButtonY, writeButton.frame.size.width, writeButton.frame.size.height)];
    [writeButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [blankView addSubview:writeButton];
    
    return blankView;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
