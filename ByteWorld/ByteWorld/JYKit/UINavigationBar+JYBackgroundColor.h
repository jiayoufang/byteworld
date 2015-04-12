//
//  UINavigationBar+JYBackgroundColor.h
//  ByteWorld
//
//  Created by fangjiayou on 15/4/12.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (JYBackgroundColor)

- (void)jy_setBackgroundColor:(UIColor *)backgroundColor;
- (void)jy_setContentAlpha:(CGFloat)alpha;
- (void)jy_setTranslationY:(CGFloat)translationY;
- (void)jy_reset;

@end
