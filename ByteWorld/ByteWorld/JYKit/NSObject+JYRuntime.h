//
//  NSObject+JYRuntime.h
//  ByteWorld
//
//  Created by 方 on 15/4/13.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JYRuntime)
/*! 该对象所遵循的协议 */
- (NSArray *)conformedProtocols;

/*! 返回对象的所有 property */
- (NSArray *)allProperties;

/*! 返回对象的所有 ivar */
- (NSArray *)allIvars;

/*! 返回所有类方法 */
+ (NSArray *)allMethods;

/*! 返回所有的实例方法  */
- (NSArray *)allMethods;

/*! 以 NSString 描述的类名 */
- (NSString *)className;

/*! 自己的实例方法及从父类继承的方法 */
- (NSArray *)allMethodsWithAdopted;

/*! 所有父类 */
- (NSArray *)parents;
@end
