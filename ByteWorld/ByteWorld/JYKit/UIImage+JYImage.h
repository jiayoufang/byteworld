//
//  UIImage+JYImage.h
//  ByteWorld
//
//  Created by 方 on 15/4/10.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JYImage)
/**
 *根据颜色生成图片
 */
+(UIImage *)imageFromColor:(UIColor *)color andSize:(CGSize)size;

/**
 *缩放图片生成缩略图
 */
-(UIImage *)makeThumbnailWithSize:(CGSize)size withCornerRadius:(float)radius;

@end
