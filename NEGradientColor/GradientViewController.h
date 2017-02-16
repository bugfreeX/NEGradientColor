//
//  GradientViewController.h
//  NEGradientColor
//
//  Created by Nslson on 2017/2/16.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Gradient.h"
@interface GradientViewController : UIViewController
@property (nonatomic , assign) UIGradientType type;
@property (nonatomic , copy) NSArray<UIColor *> * colors;
@end
