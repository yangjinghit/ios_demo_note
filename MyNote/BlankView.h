//
//  BlankView.h
//  MyNote
//
//  Created by yangjing on 2019/2/27.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlankView : UIView

+(BlankView *)blankViewWithText:(NSString *)text buttonText:(NSString *)buttonText target:(id)target action:(SEL)action;


@end
