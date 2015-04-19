//
//  NSString+JYString.m
//  ByteWorld
//
//  Created by 方 on 15/4/10.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "NSString+JYString.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (JYString)

-(NSString*)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    /* This is the md5 call  需要引入头文件#import <CommonCrypto/CommonDigest.h>*/
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
    ///Implicit conversion loses integer precision: 'unsigned long' to 'CC_LONG' (aka 'unsigned int')
}
//去空格
-(NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString*)transformFromChinese
{
    NSMutableString *pinyin = [self mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    //加上下面这一句就没有声调了，不加就有
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    return pinyin;
}

@end
