//
//  UIView+JYScreenView.m
//  ByteWorld
//
//  Created by 方 on 15/4/13.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "UIView+JYScreenView.h"

#define ScreenScale()     [[UIScreen mainScreen] scale]
#define StatusBarOrientation()    [[UIApplication sharedApplication] statusBarOrientation]

/*** 返回被放大 scale 倍后的 rect
 * @discussion 错误返回 CGRectZero
 */
CG_INLINE
CGRect CGRectMakeScale(CGRect rect, CGFloat scale)
{
    if (scale < 0.00001)
        return CGRectZero;
    
    return CGRectMake(rect.origin.x * scale, rect.origin.y * scale ,
                      rect.size.width * scale, rect.size.height * scale);
}

///*** 返回顶点为 (0,0)， 大小与frame.size 相同的矩形*/
//CG_INLINE
//CGRect CGRectMakeFull(CGRect frame)
//{
//    return CGRectMake(0, 0, frame.size.width, frame.size.height);
//}
//
///*** 返回在 r 中大小为 size，居中的矩形大小 */
//CG_INLINE
//CGRect CGRectCenterRectWithSize(CGRect r, CGSize size)
//{
//    CGRect newRect;
//    newRect.origin.x = (CGRectGetWidth(r)-size.width)/2.0;
//    newRect.origin.y = (CGRectGetHeight(r)-size.height)/2.0;
//    newRect.size = size;
//    return newRect;
//}

@implementation UIView (JYScreenView)
- (UIImage *)screenImageWithRect:(CGRect)rect
{
    CGFloat scale = ScreenScale();
    UIImage *screenshot = [self screenImage];
    rect = CGRectMakeScale(rect, scale);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([screenshot CGImage], rect);
    UIImage *croppedScreenshot = [UIImage imageWithCGImage:imageRef
                                                     scale:screenshot.scale
                                               orientation:screenshot.imageOrientation];
    CGImageRelease(imageRef);
    
    UIImageOrientation imageOrientation = [self imageOrientationWithScreenOrientation];
    return [[UIImage alloc] initWithCGImage:croppedScreenshot.CGImage
                                      scale:croppedScreenshot.scale
                                orientation:imageOrientation];
}

- (UIImage *)screenImage
{
    CGSize  layerSize = self.layer.frame.size;
    CGFloat scale     = ScreenScale();
    CGFloat opaque    = NO;
    UIGraphicsBeginImageContextWithOptions(layerSize, opaque, scale);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return screenshot;
}

- (UIImageOrientation)imageOrientationWithScreenOrientation
{
    UIInterfaceOrientation orientation = StatusBarOrientation();
    UIImageOrientation imageOrientation = UIImageOrientationUp;
    
    switch (orientation)
    {
        case UIDeviceOrientationPortraitUpsideDown:
            imageOrientation = UIImageOrientationDown;
            break;
        case UIDeviceOrientationLandscapeRight:
            imageOrientation = UIImageOrientationRight;
            break;
        case UIDeviceOrientationLandscapeLeft:
            imageOrientation = UIImageOrientationLeft;
            break;
        default:
            break;
    }
    return imageOrientation;
}
@end
