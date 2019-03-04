//
//  BaseViewController.h
//  MyNote
//
//  Created by yangjing on 2019/2/21.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UIGestureRecognizerDelegate>

-(void)setSingleLineTitle:(NSString *)title;
-(void)showLoading;
-(void)hideLoading;
-(void)showModalLoading;
-(void)hideModalLoading;
-(void)showAlertWithTitle:(NSString *)title message:(NSString *)message buttonText:(NSString *)buttonText;
-(void)setBackButton;
-(void)setLeftNavigationButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
-(void)setRightNavigationButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;


@end
