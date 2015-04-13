//
//  NSData+JYContentTypeForImageData.h
//  ByteWorld
//
//  Created by 方 on 15/4/13.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (JYContentTypeForImageData)

///根据data获取图片的类型
-(NSString*)contentTypeForImageData;

@end
