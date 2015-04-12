//
//  UIImage+JYImageEffects.h
//  ByteWorld
//
//  Created by fangjiayou on 15/4/12.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JYImageEffects)

-(UIImage*)applyLightEffect;

-(UIImage*)applyExtraLightEffect;

-(UIImage*)applyDarkEffect;

-(UIImage*)applyTintEffectWithColor:(UIColor *)tintColor;

-(UIImage*)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor*)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage*)maskImage;

@end
