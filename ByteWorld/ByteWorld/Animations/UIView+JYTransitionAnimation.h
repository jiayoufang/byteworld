//
//  UIView+JYTransitionAnimation.h
//  ByteWorld
//
//  Created by 方 on 15/4/10.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *动画效果
 */

typedef enum {
    JYTransitionAnimationTypeCameraIris,//相机
    JYTransitionAnimationTypeCube,//立方体
    JYTransitionAnimationTypeFade,//淡入
    JYTransitionAnimationTypeMoveIn,//移入
    JYTransitionAnimationTypeOglFlip,//翻转
    JYTransitionAnimationTypePageCurl,//翻下一页
    JYTransitionAnimationTypePageUnCurl,//翻上一页
    JYTransitionAnimationTypePush,
    JYTransitionAnimationTypeReveal,
    JYTransitionAnimationTypeRippleEffect,
    JYTransitionAnimationTypeSuckEffect,
}JYTransitionAnimationType;



@interface UIView (JYTransitionAnimation)

@end
