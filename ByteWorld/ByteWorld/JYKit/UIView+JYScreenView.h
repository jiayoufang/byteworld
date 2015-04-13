//
//  UIView+JYScreenView.h
//  ByteWorld
//
//  Created by 方 on 15/4/13.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 截屏
 */
@interface UIView (JYScreenView)

/*** 返回包含 view 的 image */
- (UIImage *)screenImage;

/*** 返回包含 view 中 rect 部分的 image */
- (UIImage *)screenImageWithRect:(CGRect)rect;

/*** 根据屏幕方向，返回合适的图片方向 */
- (UIImageOrientation)imageOrientationWithScreenOrientation;

@end
