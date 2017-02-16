//
//  UIColor+Gradient.m
//  NEGradientColor
//
//  Created by Nslson on 2017/2/15.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "UIColor+Gradient.h"
#import <objc/runtime.h>
@implementation UIColor (Gradient)
+(UIColor *)colorWithGradientType:(UIGradientType)type withFrame:(CGRect)frame andColors:(NSArray<UIColor *> *)colors{
    //Create our background gradient layer
    CAGradientLayer * backgroundGradientLayer = [CAGradientLayer layer];
    
    //Set the frame to our object's bounds
    backgroundGradientLayer.frame = frame;
    
    //To simplfy formatting, we'll iterate through our colors array and create a mutable array with their CG counterparts
    NSMutableArray * cgColors = [NSMutableArray array];
    for (UIColor * color in colors) {
        [cgColors addObject:(id)color.CGColor];
    }
    
    switch (type) {
        case UIGradientLeftToRight:{
            
            //Set out gradient's colors
            backgroundGradientLayer.colors = cgColors;
            
            //Specify the direction our gradient will take
            [backgroundGradientLayer setStartPoint:CGPointMake(0.0, 0.5)];
            [backgroundGradientLayer setEndPoint:CGPointMake(1.0, 0.5)];
            
            //Convert our CALayer to a UIImage object
            UIGraphicsBeginImageContextWithOptions(backgroundGradientLayer.bounds.size, NO, [UIScreen mainScreen].scale);
            [backgroundGradientLayer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage * backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            [self setGradientImage:backgroundColorImage];
            return [UIColor colorWithPatternImage:backgroundColorImage];
        }
            break;
        case UIGradientRadial:{
            UIGraphicsBeginImageContextWithOptions(frame.size,NO, [UIScreen mainScreen].scale);
            
            //Specific the spread of the gradient (For now this gradient only takes 2 locations)
            CGFloat locations[2] = {0.0, 1.0};
            
            //Default to the RGB Colorspace
            CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
            CFArrayRef arrayRef = (__bridge CFArrayRef)cgColors;
            
            //Create our Fradient
            CGGradientRef myGradient = CGGradientCreateWithColors(myColorspace, arrayRef, locations);
            
            
            // Normalise the 0-1 ranged inputs to the width of the image
            CGPoint myCentrePoint = CGPointMake(0.5 * frame.size.width, 0.5 * frame.size.height);
            float myRadius = MIN(frame.size.width, frame.size.height) * 0.6;
            
            // Draw our Gradient
            CGContextDrawRadialGradient (UIGraphicsGetCurrentContext(), myGradient, myCentrePoint,
                                         0, myCentrePoint, myRadius,
                                         kCGGradientDrawsAfterEndLocation);
            
            // Grab it as an Image
            UIImage *backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext();
            
            // Clean up
            CGColorSpaceRelease(myColorspace); // Necessary?
            CGGradientRelease(myGradient); // Necessary?
            UIGraphicsEndImageContext();
            
            [self setGradientImage:backgroundColorImage];
            return [UIColor colorWithPatternImage:backgroundColorImage];
        }
            break;
        case UIGradientTopToBottom:{
            //Set out gradient's colors
            backgroundGradientLayer.colors = cgColors;
            
            //Convert our CALayer to a UIImage object
            UIGraphicsBeginImageContextWithOptions(backgroundGradientLayer.bounds.size,NO, [UIScreen mainScreen].scale);
            [backgroundGradientLayer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            [self setGradientImage:backgroundColorImage];
            return [UIColor colorWithPatternImage:backgroundColorImage];
        }
            break;
    }
}

+ (void)setGradientImage:(UIImage *)gradientImage {
    
    objc_setAssociatedObject(self, @selector(gradientImage), gradientImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (UIImage *)gradientImage {
    
    return objc_getAssociatedObject(self, @selector(gradientImage));
}
@end
