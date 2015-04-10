//
//  JYToolsManager.h
//  ByteWorld
//
//  Created by 方 on 15/4/10.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JYToolsManager : NSObject
/**
 * 单例生成方法
 */
+(instancetype)manager;

/**
 *获取文本高度
 */
-(CGSize)getSizeFromContent:(NSString  *)content size:(CGSize)size font:(UIFont *)font;

@end
