//
//  UIImage+Ketang.m
//  MyNote
//
//  Created by yangjing on 2019/3/1.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import "UIImage+Ketang.h"

@implementation UIImage (Ketang)

+(UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size{
    
    UIGraphicsBeginImageContext(size);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width * [UIScreen mainScreen].scale, size.height * [UIScreen mainScreen].scale));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}

@end
