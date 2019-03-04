//
//  UIButton+Ketang.h
//  MyNote
//
//  Created by yangjing on 2019/2/28.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Ketang)

+(UIButton *)contentButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+(UIButton *)navigationButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+(UIButton *)navigationBackButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;


@end
