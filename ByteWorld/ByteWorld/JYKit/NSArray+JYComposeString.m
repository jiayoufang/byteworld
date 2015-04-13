//
//  NSArray+JYComposeString.m
//  ByteWorld
//
//  Created by 方 on 15/4/13.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "NSArray+JYComposeString.h"

@implementation NSArray (JYComposeString)

-(NSString*)componentString
{
    if ([self count] == 0) {
        return @"";
    }
    NSMutableString *str = [NSMutableString string];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([str isKindOfClass:[NSString class]]) {
            [str appendString:obj];
        }else{
            [str appendString:[obj description]];
        }
    }];
    return str;
}

@end
