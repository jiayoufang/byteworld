//
//  NSString+JYString.h
//  ByteWorld
//
//  Created by 方 on 15/4/10.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JYString)

/**
 *md5加密
 */
-(NSString *)md5;

/**
 *去空格
 */
-(NSString*)trim;
@end
