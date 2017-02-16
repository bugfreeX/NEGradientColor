//
//  UIColor+Gradient.h
//  NEGradientColor
//
//  Created by Nslson on 2017/2/15.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,UIGradientType) {
    UIGradientLeftToRight,
    UIGradientRadial,
    UIGradientTopToBottom
};

@interface UIColor (Gradient)
+(UIColor * )colorWithGradientType:(UIGradientType)type withFrame:(CGRect)frame andColors:(NSArray<UIColor *> *)colors;
@end
